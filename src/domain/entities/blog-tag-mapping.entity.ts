import { Entity, Column } from 'typeorm';
import { BaseEntity } from './base.entity';

@Entity('blog_tag_mapping')
export class BlogTagMapping extends BaseEntity {
  @Column()
  blog_id: number;

  @Column()
  tag_id: number;
}