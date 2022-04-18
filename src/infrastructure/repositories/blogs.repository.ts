import { EntityRepository } from 'typeorm';
import { Blog } from 'src/domain/entities/blogs.entity';
import { BaseRepository } from 'src/infrastructure/repositories/base.repository';

@EntityRepository(Blog)
export class BlogsRepository extends BaseRepository<Blog> {
  public async getBlogInHome(page: number, pageSize: number) {
    return this.query(`CALL GetListBlogInHome(${pageSize}, ${(page-1) * pageSize})`);
  }
}