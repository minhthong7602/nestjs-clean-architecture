import { Entity, Column } from 'typeorm';
import { BaseEntity } from './base.entity';

@Entity('blog_comment')
export class BlogComment extends BaseEntity {
  @Column()
  created_at: Date;

  @Column()
  updated_at: Date;

  @Column()
  content: string;

  @Column()
  username: string;

  @Column()
  ip: string;

  @Column()
  token: string;

  @Column()
  blog_id: number;

  @Column()
  status: number;
}