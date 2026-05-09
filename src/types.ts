import type { MenuItem } from '@olonjs/core';

import type { HeaderData, HeaderSettings } from '@/components/header';
import type { FooterData, FooterSettings } from '@/components/footer';
import type { MonumentalHeroData, MonumentalHeroSettings } from '@/components/monumental-hero';
import type { ManifestoGridData, ManifestoGridSettings } from '@/components/manifesto-grid';
import type { ProjectIndexData, ProjectIndexSettings } from '@/components/project-index';
import type { TextImageSlabData, TextImageSlabSettings } from '@/components/text-image-slab';
import type { TimelineListData, TimelineListSettings } from '@/components/timeline-list';
import type { FaqSectionData, FaqSectionSettings } from '@/components/faq-section';
import type { ContactStripData, ContactStripSettings } from '@/components/contact-strip';
import type { QuoteWallData, QuoteWallSettings } from '@/components/quote-wall';

export type SectionComponentPropsMap = {
  'header': { data: HeaderData; settings: HeaderSettings; menu: MenuItem[] };
  'footer': { data: FooterData; settings: FooterSettings; menu?: MenuItem[] };
  'monumental-hero': { data: MonumentalHeroData; settings: MonumentalHeroSettings };
  'manifesto-grid': { data: ManifestoGridData; settings: ManifestoGridSettings };
  'project-index': { data: ProjectIndexData; settings: ProjectIndexSettings };
  'text-image-slab': { data: TextImageSlabData; settings: TextImageSlabSettings };
  'timeline-list': { data: TimelineListData; settings: TimelineListSettings };
  'faq-section': { data: FaqSectionData; settings: FaqSectionSettings };
  'contact-strip': { data: ContactStripData; settings: ContactStripSettings };
  'quote-wall': { data: QuoteWallData; settings: QuoteWallSettings };
};

declare module '@olonjs/core' {
  export interface SectionDataRegistry {
    'header': HeaderData;
    'footer': FooterData;
    'monumental-hero': MonumentalHeroData;
    'manifesto-grid': ManifestoGridData;
    'project-index': ProjectIndexData;
    'text-image-slab': TextImageSlabData;
    'timeline-list': TimelineListData;
    'faq-section': FaqSectionData;
    'contact-strip': ContactStripData;
    'quote-wall': QuoteWallData;
  }

  export interface SectionSettingsRegistry {
    'header': HeaderSettings;
    'footer': FooterSettings;
    'monumental-hero': MonumentalHeroSettings;
    'manifesto-grid': ManifestoGridSettings;
    'project-index': ProjectIndexSettings;
    'text-image-slab': TextImageSlabSettings;
    'timeline-list': TimelineListSettings;
    'faq-section': FaqSectionSettings;
    'contact-strip': ContactStripSettings;
    'quote-wall': QuoteWallSettings;
  }
}

export * from '@olonjs/core';
