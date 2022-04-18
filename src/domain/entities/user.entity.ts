import { Entity, Column } from 'typeorm';
import { BaseEntity } from './base.entity';

@Entity('users')
export class Users extends BaseEntity {
  @Column()
  created_at: Date;

  @Column()
  username: string;

  @Column()
  password: string;

  @Column()
  password_salt: string;

  @Column()
  last_ip: string;

  @Column()
  last_logged: Date;

  @Column()
  role_id: number;
}