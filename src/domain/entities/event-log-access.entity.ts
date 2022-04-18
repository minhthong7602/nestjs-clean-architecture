import { Entity, Column } from 'typeorm';
import { BaseEntity } from './base.entity';

@Entity('event_log_access')
export class EventLogAccess extends BaseEntity {
  @Column()
  created_at: Date;

  @Column()
  ip: string;

  @Column()
  api_url: string;

  @Column()
  api_method: string;
}
