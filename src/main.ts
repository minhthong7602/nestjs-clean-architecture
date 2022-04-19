import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule, {
    cors: true
  });

  const config = new DocumentBuilder()
    .setTitle('BruceLee Blog API Minh Thong')
    .setDescription('The BruceLee Blog API description')
    .setVersion('1.1')
    .addTag('Blogs MT')
    .addBearerAuth()
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('api', app, document);
  
  await app.listen(5000);
}
bootstrap();
