import { ApiProperty } from '@nestjs/swagger';
import { Entity, Column } from 'typeorm';
import { BaseEntity } from './base.entity';

@Entity('tags')
export class Tag extends BaseEntity {
  @ApiProperty()
  @Column()
  created_at: Date;

  @ApiProperty()
  @Column()
  name: string;

  @ApiProperty()
  @Column()
  description: string;

  @ApiProperty()
  @Column()
  is_active: boolean;

  constructor(name: string, description: string, is_active: boolean) {
    super();
    this.name = name;
    this.description = description;
    this.is_active = is_active;
  }
}