import { z } from 'zod';
import { BaseArrayItem, BaseSectionData } from '@/lib/base-schemas';

const QuoteItemSchema = BaseArrayItem.extend({
  quote: z.string().describe('ui:textarea'),
  author: z.string().describe('ui:text'),
  role: z.string().describe('ui:text')
});

export const QuoteWallSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  items: z.array(QuoteItemSchema).describe('ui:list')
});
