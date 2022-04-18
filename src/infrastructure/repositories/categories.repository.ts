import { EntityRepository } from 'typeorm';
import { Category } from 'src/domain/entities/categories.entity';
import { BaseRepository } from 'src/infrastructure/repositories/base.repository';

@EntityRepository(Category)
export class CategoriesRepository extends BaseRepository<Category> {

}