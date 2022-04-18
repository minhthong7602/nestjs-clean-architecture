import { Entity, Column } from 'typeorm';
import { BlogUpdateEvent } from 'src/domain/events/blogs/update-blog.event';
import { BaseEntity } from 'src/domain/entities/base.entity';
import { BlogSendPushEvent } from '../events/blogs/send-push-update.event';
import { ApiProperty } from '@nestjs/swagger';

@Entity('blogs')
export class Blog extends BaseEntity {
  @ApiProperty()
  @Column()
  created_at: Date;

  @ApiProperty()
  @Column()
  updated_at: Date;

  @ApiProperty()
  @Column()
  title: string;

  @ApiProperty()
  @Column()
  sub_title: string;

  @ApiProperty()
  @Column()
  content: string;

  @ApiProperty()
  @Column()
  images: string;

  @ApiProperty()
  @Column()
  status: number;

  updateBlog(content: string, title: string, sub_title: string, status: number) {
    this.updated_at = new Date();
    this.content = content;
    this.title = title;
    this.sub_title = sub_title;
    this.status = status;
    this.domainEvents.push(new BlogUpdateEvent('Update Blog Event', this.id, this.title));
    this.domainEvents.push(new BlogSendPushEvent('Send Push Update Blog Event', this.id, this.title));
  }
}