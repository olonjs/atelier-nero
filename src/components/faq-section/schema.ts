import { z } from 'zod';
import { BaseArrayItem, BaseSectionData } from '@/lib/base-schemas';

const FaqItemSchema = BaseArrayItem.extend({
  question: z.string().describe('ui:text'),
  answer: z.string().describe('ui:textarea')
});

export const FaqSectionSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  intro: z.string().describe('ui:textarea'),
  items: z.array(FaqItemSchema).describe('ui:list')
});
