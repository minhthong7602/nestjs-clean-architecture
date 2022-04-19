import { Controller, Get, Res, HttpStatus, UseGuards, Post, Body, Query } from '@nestjs/common';
import { CommandBus, QueryBus } from '@nestjs/cqrs';
import { ListBlogInHomeQuery } from 'src/application/queries/blogs/_index';
import { AddOrUpdateBlogCommand } from 'src/application/commands/blogs/_index';
import { JwtAuthGuard } from 'src/application/core/auth/jwt-auth.guard';
import { Roles } from 'src/application/core/decorators/roles.decorator';
import { ROLE_CONIFG } from 'src/application/core/auth/auth.config';
import { ApiBearerAuth, ApiResponse, ApiTags } from '@nestjs/swagger';
import { ResponseModel } from 'src/application/core/configs/response-status.config';
import { Blog } from 'src/domain/entities/blogs.entity';
import { ListBlogInHome } from 'src/application/queries/blogs/listHome.query';

@UseGuards(JwtAuthGuard)
@Controller('api/blogs')
@ApiTags('blogs')
export class BlogsController {
  constructor(
    private readonly commandBus: CommandBus,
    private readonly queryBus: QueryBus
  ) {}

  @ApiBearerAuth()
  @Roles(ROLE_CONIFG.admin)
  @Get()
  @ApiResponse({ status: 200, description: 'The record has been successfully get list blogs.', type: ListBlogInHome })
  public async getBlogsInHome(
    @Query() params: ListBlogInHomeQuery
  ) : Promise<ResponseModel<Blog[]>> {
    return await this.queryBus.execute(new ListBlogInHomeQuery(
      params.page,
      params.page_size
    ));
  }

  @ApiBearerAuth()
  @Roles(ROLE_CONIFG.admin)
  @Post('create')
  public async addOrUpdateBlog(
    @Body() body: AddOrUpdateBlogCommand
  ) : Promise<ResponseModel<Blog>> {
    return await this.commandBus.execute(new AddOrUpdateBlogCommand(
      body.id,
      body.title,
      body.sub_title,
      body.content,
      body.tags,
      body.categories,
      body.status
    ));
  }
}
