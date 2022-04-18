import { Entity, Column } from 'typeorm';
import { BaseEntity } from './base.entity';

@Entity('http_exception_access')
export class HttpExceptionAccess extends BaseEntity {
  @Column()
  created_at: Date;

  @Column()
  ip: string;

  @Column()
  api_url: string;

  @Column()
  api_method: string;

  @Column()
  api_error: string;

  @Column()
  api_status: number;
}