import { z } from 'zod';
import { BaseSectionData, CtaSchema, ImageSelectionSchema } from '@/lib/base-schemas';

export const HeroSchema = BaseSectionData.extend({
  eyebrow:          z.string().optional().describe('ui:text'),
  title:            z.string().describe('ui:text'),
  titleHighlight:   z.string().optional().describe('ui:text'),
  description:      z.string().optional().describe('ui:textarea'),
  ctas:             z.array(CtaSchema).optional().describe('ui:list'),
  docsLabel:        z.string().optional().describe('ui:text'),
  docsHref:         z.string().optional().describe('ui:text'),
  codeLabel:        z.string().optional().describe('ui:text'),
  heroImage:        ImageSelectionSchema.optional().describe('ui:image-picker'),
});

export const HeroSettingsSchema = z.object({
  showCode: z.boolean().default(true).describe('ui:checkbox'),
});
