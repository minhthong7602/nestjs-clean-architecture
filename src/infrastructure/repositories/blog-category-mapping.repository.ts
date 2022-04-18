import { EntityRepository } from 'typeorm';
import { BlogCategoryMapping } from 'src/domain/entities/blog-category-mapping.entity';
import { BaseRepository } from './base.repository';
import { CommonService } from 'src/application/core/ultils/common.service';

@EntityRepository(BlogCategoryMapping)
export class BlogCategoryMappingRepository extends BaseRepository<BlogCategoryMapping> {
  commonService: CommonService;

  public async deleteByBlog(blog_id: number) {
    return this.query(`DELETE FROM blog_category_mapping WHERE blog_id=${blog_id}`);
  }
  
  public async insertList(blog_id: number, categories: number[]) {
    this.commonService = new CommonService();
    await this.commonService.asyncForEach(categories, async (category_id) => {
      const item = new BlogCategoryMapping();
      item.blog_id = blog_id;
      item.category_id = category_id;
      await this.insertData(item);
    });
  }
}
