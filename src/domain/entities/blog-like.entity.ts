import { Entity, Column } from 'typeorm';
import { BaseEntity } from './base.entity';

@Entity('blog_like')
export class BlogLike extends BaseEntity {
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

  @Column()
  status: number;
}