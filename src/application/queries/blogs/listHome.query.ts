import { QueryHandler, IQueryHandler } from '@nestjs/cqrs';
import { InjectRepository } from '@nestjs/typeorm';
import { ResponseModel, RESPONSE_STATUS } from 'src/application/core/configs/response-status.config';
import { BlogsRepository } from 'src/infrastructure/repositories/blogs.repository';
import { TagsRepository } from 'src/infrastructure/repositories/tags.repository';
import { Blog } from 'src/domain/entities/blogs.entity';
import { Tag } from 'src/domain/entities/tags.entity';
import { CommonService } from 'src/application/core/ultils/common.service';
import { ApiProperty } from '@nestjs/swagger';

export class ListBlogInHomeQuery {
  @ApiProperty()
  page: number;

  @ApiProperty()
  page_size: number;
  constructor(page: number, page_size: number) {
    this.page = page;
    this.page_size = page_size;   
  }
}

export class BlogInHome extends Blog {
  @ApiProperty()
  total_view: number;

  @ApiProperty()
  total_like: number;

  @ApiProperty()
  total_comment: number;

  @ApiProperty({ type: Tag, isArray: true })
  tags?: Tag[];
}

export class ListBlogInHome extends ResponseModel<Blog[]> {
  @ApiProperty({ type: BlogInHome, isArray: true })
  data: BlogInHome[];
}

@QueryHandler(ListBlogInHomeQuery)
export class ListBlogInHomeHandler implements IQueryHandler<ListBlogInHomeQuery> {
  constructor(
    @InjectRepository(BlogsRepository)
    private readonly blogRepository: BlogsRepository,
    @InjectRepository(TagsRepository)
    private readonly tagRepository: TagsRepository,
    private commonService: CommonService
  ) {}

  public async execute(query: ListBlogInHomeQuery) : Promise<ListBlogInHome> {
    const response = new ListBlogInHome();
    try {
      const result = await this.blogRepository.getBlogInHome(query.page, query.page_size);
      response.data = result[0] as BlogInHome[];
      await this.commonService.asyncForEach(response.data,  async (blog, index) => {
        const tags = await this.tagRepository.getTagsByBlog(blog.id);
        response.data[index].tags = tags[0];
        
      });
      response.status = RESPONSE_STATUS.SUCCESSED;
    } catch(err) {
      response.data = null;
      response.status = RESPONSE_STATUS.ERROR;
      response.message = err;
    }
    return response;
  }
}

function ApiModelProperty(arg0: { type: any; isArray: boolean; }) {
  throw new Error('Function not implemented.');
}
