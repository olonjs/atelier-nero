import { z } from 'zod';
import { BaseSectionData, CtaSchema, ImageSelectionSchema } from '@/lib/base-schemas';

export const MonumentalHeroSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:textarea'),
  titleHighlight: z.string().optional().describe('ui:text'),
  description: z.string().describe('ui:textarea'),
  primaryCta: CtaSchema.optional(),
  secondaryCta: CtaSchema.optional(),
  image: ImageSelectionSchema.optional(),
  note: z.string().optional().describe('ui:text')
});
