import { EntityRepository } from 'typeorm';
import { BlogTagMapping } from 'src/domain/entities/blog-tag-mapping.entity';
import { BaseRepository } from 'src/infrastructure/repositories/base.repository';
import { CommonService } from 'src/application/core/ultils/common.service';
@EntityRepository(BlogTagMapping)
export class BlogTagMappingRepository extends BaseRepository<BlogTagMapping> {
  commonService: CommonService;
  public async deleteByBlog(blog_id: number) {
    return this.query(`DELETE FROM blog_tag_mapping WHERE blog_id=${blog_id}`);
  }
  
  public async insertList(blog_id: number, tags: number[]) {
    this.commonService = new CommonService();
    await this.commonService.asyncForEach(tags, async (tag_id) => {
      const item = new BlogTagMapping();
      item.blog_id = blog_id;
      item.tag_id = tag_id;
      await this.insertData(item);
    });
  }
}