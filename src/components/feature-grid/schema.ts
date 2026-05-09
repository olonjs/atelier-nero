import { z } from 'zod';
import { BaseSectionData, BaseArrayItem, ImageSelectionSchema } from '@/lib/base-schemas';

export const FeatureCardSchema = BaseArrayItem.extend({
  icon:        ImageSelectionSchema.optional().describe('ui:image-picker'),
  title:       z.string().describe('ui:text'),
  description: z.string().describe('ui:textarea'),
});

export const ProofTierSchema = BaseArrayItem.extend({
  label: z.string().describe('ui:text'),
});

export const FeatureGridSchema = BaseSectionData.extend({
  label:              z.string().optional().describe('ui:text'),
  sectionTitle:       z.string().describe('ui:text'),
  sectionTitleItalic: z.string().optional().describe('ui:text'),
  sectionLead:        z.string().optional().describe('ui:textarea'),
  cards:              z.array(FeatureCardSchema).describe('ui:list'),
  proofStatement:     z.string().optional().describe('ui:text'),
  proofSub:           z.string().optional().describe('ui:text'),
  tiers:              z.array(ProofTierSchema).optional().describe('ui:list'),
});

export const FeatureGridSettingsSchema = z.object({
  columns: z.union([z.literal(2), z.literal(3), z.literal(4)]).default(3).describe('ui:number'),
});
