import { Entity, Column } from 'typeorm';
import { BaseEntity } from './base.entity';

@Entity('blog_view')
export class BlogView extends BaseEntity {
  @Column()
  created_at: Date;

  @Column()
  updated_at: Date;

  @Column()
  ip: string;

  @Column()
  token: string;

  @Column()
  blog_id: number;
}