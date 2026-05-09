import React from 'react';
import { Header } from '@/components/header';
import { Footer } from '@/components/footer';
import { MonumentalHero } from '@/components/monumental-hero';
import { ManifestoGrid } from '@/components/manifesto-grid';
import { ProjectIndex } from '@/components/project-index';
import { TextImageSlab } from '@/components/text-image-slab';
import { TimelineList } from '@/components/timeline-list';
import { FaqSection } from '@/components/faq-section';
import { ContactStrip } from '@/components/contact-strip';
import { QuoteWall } from '@/components/quote-wall';

import type { SectionType } from '@olonjs/core';
import type { SectionComponentPropsMap } from '@/types';

export const ComponentRegistry: {
  [K in SectionType]: React.FC<SectionComponentPropsMap[K]>;
} = {
  'header': Header,
  'footer': Footer,
  'monumental-hero': MonumentalHero,
  'manifesto-grid': ManifestoGrid,
  'project-index': ProjectIndex,
  'text-image-slab': TextImageSlab,
  'timeline-list': TimelineList,
  'faq-section': FaqSection,
  'contact-strip': ContactStrip,
  'quote-wall': QuoteWall
};
