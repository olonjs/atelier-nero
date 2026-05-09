// Layout: Hero=F (MINIMAL HERO), Features=D (ACCORDION)
import React from 'react';
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from '@/components/ui/accordion';
import type { FaqSectionData, FaqSectionSettings } from './types';

export const FaqSection: React.FC<{ data: FaqSectionData; settings: FaqSectionSettings }> = ({ data }) => (
  <section
    style={{
      '--local-bg': 'var(--background)',
      '--local-text': 'var(--foreground)',
      '--local-text-muted': 'var(--muted-foreground)',
      '--local-primary': 'var(--primary)',
      '--local-border': 'var(--border)',
      '--local-surface': 'var(--card)'
    } as React.CSSProperties}
    className="relative z-0 border-t border-[var(--local-border)] py-28 bg-[var(--local-bg)]"
  >
    <div className="mx-auto max-w-[1200px] px-8">
      {data.label && (
        <div className="jp-section-label mb-4 inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-text)]/70" data-jp-field="label">
          <span className="h-px w-5 bg-[var(--local-text)]" />
          {data.label}
        </div>
      )}
      <div className="grid gap-10 lg:grid-cols-[0.75fr_1.25fr]">
        <div>
          <h2 className="font-display text-[clamp(2rem,4.5vw,3.8rem)] font-black leading-[1.05] tracking-tight text-[var(--local-text)]" data-jp-field="title">
            {data.title}
          </h2>
          <p className="mt-6 max-w-md font-primary text-sm text-[var(--local-text-muted)]" data-jp-field="intro">
            {data.intro}
          </p>
        </div>
        <Accordion type="single" collapsible className="border-t border-[var(--local-border)]">
          {data.items.map((item, idx) => (
            <AccordionItem key={item.id || 'legacy-' + idx} value={item.id || 'legacy-' + idx} className="border-b border-[var(--local-border)]" data-jp-item-id={item.id || 'legacy-' + idx} data-jp-item-field="items">
              <AccordionTrigger className="font-display text-left text-[1.1rem] font-bold tracking-tight text-[var(--local-text)] hover:no-underline">
                {item.question}
              </AccordionTrigger>
              <AccordionContent className="max-w-2xl font-primary text-sm text-[var(--local-text-muted)]">
                {item.answer}
              </AccordionContent>
            </AccordionItem>
          ))}
        </Accordion>
      </div>
    </div>
  </section>
);
