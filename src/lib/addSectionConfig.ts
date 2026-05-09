import type { AddSectionConfig } from '@olonjs/core';

const addableSectionTypes = [
  'monumental-hero',
  'manifesto-grid',
  'project-index',
  'text-image-slab',
  'timeline-list',
  'faq-section',
  'contact-strip',
  'quote-wall'
] as const;

const sectionTypeLabels: Record<string, string> = {
  'monumental-hero': 'Monumental Hero',
  'manifesto-grid': 'Manifesto Grid',
  'project-index': 'Project Index',
  'text-image-slab': 'Text Image Slab',
  'timeline-list': 'Timeline List',
  'faq-section': 'FAQ Section',
  'contact-strip': 'Contact Strip',
  'quote-wall': 'Quote Wall'
};

function getDefaultSectionData(type: string): Record<string, unknown> {
  switch (type) {
    case 'monumental-hero':
      return {
        label: 'Practice',
        title: 'A studio for\nmeasured space',
        description: 'We shape architecture, exhibition systems, and spatial identity through strict proportion, material precision, and cultural clarity.'
      };
    case 'manifesto-grid':
      return {
        title: 'Manifesto',
        intro: 'Core positions that guide commissions, collaborations, and long-term spatial thinking.',
        items: []
      };
    case 'project-index':
      return {
        title: 'Selected projects',
        intro: 'A concise index of buildings, interiors, and cultural systems.',
        items: []
      };
    case 'text-image-slab':
      return {
        title: 'Spatial rigor',
        body: 'Every commission begins with use, sequence, threshold, and light.',
        eyebrow: 'Study'
      };
    case 'timeline-list':
      return {
        title: 'Practice timeline',
        intro: 'A chronology of the studio and its built work.',
        items: []
      };
    case 'faq-section':
      return {
        title: 'Questions',
        intro: 'Commissioning, schedules, and process.',
        items: []
      };
    case 'contact-strip':
      return {
        title: 'Start a conversation',
        description: 'Share your brief, site, and timeline.',
        details: []
      };
    case 'quote-wall':
      return {
        title: 'Selected voices',
        items: []
      };
    default:
      return {};
  }
}

export const addSectionConfig: AddSectionConfig = {
  addableSectionTypes: [...addableSectionTypes],
  sectionTypeLabels,
  getDefaultSectionData
};
