import { z } from 'zod';
import { BaseArrayItem, BaseSectionData, ImageSelectionSchema } from '@/lib/base-schemas';

const ProjectItemSchema = BaseArrayItem.extend({
  year: z.string().describe('ui:text'),
  title: z.string().describe('ui:text'),
  category: z.string().describe('ui:text'),
  location: z.string().describe('ui:text'),
  body: z.string().describe('ui:textarea'),
  href: z.string().describe('ui:text'),
  image: ImageSelectionSchema.optional()
});

export const ProjectIndexSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  intro: z.string().describe('ui:textarea'),
  items: z.array(ProjectItemSchema).describe('ui:list')
});
