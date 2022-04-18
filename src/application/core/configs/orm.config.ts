import { TypeOrmModuleOptions } from '@nestjs/typeorm';
export const ormConfig: TypeOrmModuleOptions = {
  type: 'mysql',
  host: 'mysql-76133-0.cloudclusters.net',
  username: 'admin',
  password: 'z0VTi5JF',
  port: 12020,
  database: 'bruceleeblog',
  entities: ["dist/**/*.entity{.ts,.js}"],
  synchronize: false
}