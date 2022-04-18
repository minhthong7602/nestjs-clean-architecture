import { Entity, Column } from 'typeorm';
import { BaseEntity } from './base.entity';

@Entity('categories')
export class Category extends BaseEntity {
  @Column()
  created_at: Date;

  @Column()
  name: string;

  @Column()
  is_active: boolean;

  @Column()
  description: string;
}