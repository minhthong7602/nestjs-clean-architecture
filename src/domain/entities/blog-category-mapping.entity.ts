import { Entity, Column } from 'typeorm';
import { BaseEntity } from './base.entity';

@Entity('blog_category_mapping')
export class BlogCategoryMapping extends BaseEntity {
  @Column()
  blog_id: number;

  @Column()
  category_id: number;
}