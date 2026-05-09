import { z } from 'zod';
import { BaseSectionData, CtaSchema, ImageSelectionSchema } from '@/lib/base-schemas';

export const TextImageSlabSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  body: z.string().describe('ui:textarea'),
  eyebrow: z.string().optional().describe('ui:text'),
  image: ImageSelectionSchema.optional(),
  primaryCta: CtaSchema.optional()
});
