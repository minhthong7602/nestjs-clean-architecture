import { EntityRepository } from 'typeorm';
import { Tag } from 'src/domain/entities/tags.entity';
import { BaseRepository } from 'src/infrastructure/repositories/base.repository';

@EntityRepository(Tag)
export class TagsRepository extends BaseRepository<Tag> {
  public async getTagsByBlog(blogId: number) {
    return this.query(`CALL GetTagsByBlog(${blogId})`);
  }
}