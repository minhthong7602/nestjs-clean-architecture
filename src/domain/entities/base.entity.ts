import { AggregateRoot } from "@nestjs/cqrs";
import { PrimaryGeneratedColumn } from "typeorm";
import { BaseEvent } from "src/domain/events/base-event";

export class BaseEntity extends AggregateRoot {
  @PrimaryGeneratedColumn()
  id: number;

  domainEvents: BaseEvent[] = [];
}