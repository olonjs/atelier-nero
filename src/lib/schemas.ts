export { BaseSectionData, BaseArrayItem, BaseSectionSettingsSchema, CtaSchema } from './base-schemas';

import { HeaderSchema } from '@/components/header';
import { FooterSchema } from '@/components/footer';
import { MonumentalHeroSchema } from '@/components/monumental-hero';
import { ManifestoGridSchema } from '@/components/manifesto-grid';
import { ProjectIndexSchema } from '@/components/project-index';
import { TextImageSlabSchema } from '@/components/text-image-slab';
import { TimelineListSchema } from '@/components/timeline-list';
import { FaqSectionSchema } from '@/components/faq-section';
import { ContactStripSchema } from '@/components/contact-strip';
import { QuoteWallSchema } from '@/components/quote-wall';

export const SECTION_SCHEMAS = {
  'header': HeaderSchema,
  'footer': FooterSchema,
  'monumental-hero': MonumentalHeroSchema,
  'manifesto-grid': ManifestoGridSchema,
  'project-index': ProjectIndexSchema,
  'text-image-slab': TextImageSlabSchema,
  'timeline-list': TimelineListSchema,
  'faq-section': FaqSectionSchema,
  'contact-strip': ContactStripSchema,
  'quote-wall': QuoteWallSchema
} as const;

export type SectionType = keyof typeof SECTION_SCHEMAS;
