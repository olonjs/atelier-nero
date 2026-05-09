import { z } from 'zod';
import { BaseArrayItem, BaseSectionData, CtaSchema } from '@/lib/base-schemas';

const DetailItemSchema = BaseArrayItem.extend({
  label: z.string().describe('ui:text'),
  value: z.string().describe('ui:text')
});

export const ContactStripSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  description: z.string().describe('ui:textarea'),
  details: z.array(DetailItemSchema).describe('ui:list'),
  primaryCta: CtaSchema.optional()
});
