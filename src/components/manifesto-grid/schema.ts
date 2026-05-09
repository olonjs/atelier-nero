import { z } from 'zod';
import { BaseArrayItem, BaseSectionData } from '@/lib/base-schemas';

const ManifestoItemSchema = BaseArrayItem.extend({
  number: z.string().describe('ui:text'),
  title: z.string().describe('ui:text'),
  body: z.string().describe('ui:textarea')
});

export const ManifestoGridSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  intro: z.string().describe('ui:textarea'),
  items: z.array(ManifestoItemSchema).describe('ui:list')
});
