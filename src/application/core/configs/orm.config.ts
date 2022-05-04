import { TypeOrmModuleOptions } from '@nestjs/typeorm';
export const ormConfig: TypeOrmModuleOptions = {
  type: 'mysql',
  host: 'mysql-78002-0.cloudclusters.net',
  username: 'admin',
  password: 'o0c95j1g',
  port: 14240,
  database: 'bruceleeblog',
  entities: ["dist/**/*.entity{.ts,.js}"],
  synchronize: false
}