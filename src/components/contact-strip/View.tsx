// Layout: Hero=E (MAGAZINE), Features=B (HORIZONTAL SCROLL)
import React from 'react';
import { ArrowRight } from 'lucide-react';
import { Button } from '@/components/ui/button';
import type { ContactStripData, ContactStripSettings } from './types';

export const ContactStrip: React.FC<{ data: ContactStripData; settings: ContactStripSettings }> = ({ data }) => (
  <section
    style={{
      '--local-bg': 'var(--foreground)',
      '--local-text': 'var(--background)',
      '--local-text-muted': 'color-mix(in oklch, var(--background) 72%, transparent)',
      '--local-primary': 'var(--background)',
      '--local-primary-foreground': 'var(--foreground)',
      '--local-border': 'color-mix(in oklch, var(--background) 24%, transparent)',
      '--local-surface': 'var(--foreground)',
      '--local-radius-md': 'var(--theme-radius-md)'
    } as React.CSSProperties}
    className="relative z-0 py-24 bg-[var(--local-bg)] text-[var(--local-text)]"
  >
    <div className="mx-auto max-w-[1200px] px-8">
      {data.label && (
        <div className="jp-section-label mb-4 inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-text)]/70" data-jp-field="label">
          <span className="h-px w-5 bg-[var(--local-text)]" />
          {data.label}
        </div>
      )}
      <div className="grid gap-8 lg:grid-cols-[0.9fr_1.1fr]">
        <div>
          <h2 className="font-display text-[clamp(2.4rem,5vw,4.4rem)] font-black leading-[1.02] tracking-tight text-[var(--local-text)]" data-jp-field="title">
            {data.title}
          </h2>
        </div>
        <div>
          <p className="max-w-xl font-primary text-sm text-[var(--local-text-muted)]" data-jp-field="description">
            {data.description}
          </p>
          <div className="mt-8 grid gap-0 border-t border-[var(--local-border)] md:grid-cols-3">
            {data.details.map((item, idx) => (
              <div key={item.id || 'legacy-' + idx} className="border-b border-r border-[var(--local-border)] py-5 pr-5" data-jp-item-id={item.id || 'legacy-' + idx} data-jp-item-field="details">
                <div className="font-mono text-[0.68rem] uppercase tracking-[0.16em] text-[var(--local-text)]/65">{item.label}</div>
                <div className="mt-2 font-primary text-sm text-[var(--local-text)]">{item.value}</div>
              </div>
            ))}
          </div>
          {data.primaryCta && (
            <Button variant="link" asChild className="mt-8 h-auto p-0 font-mono text-[0.78rem] uppercase tracking-[0.16em] text-[var(--local-text)] no-underline">
              <a href={data.primaryCta.href} data-jp-field="primaryCta">
                {data.primaryCta.label}
                <ArrowRight className="ml-2 h-4 w-4" />
              </a>
            </Button>
          )}
        </div>
      </div>
    </div>
  </section>
);
