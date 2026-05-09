// Layout: Hero=A (SPLIT 60/40), Features=B (HORIZONTAL SCROLL)
import React from 'react';
import { ArrowRight } from 'lucide-react';
import { Button } from '@/components/ui/button';
import type { TextImageSlabData, TextImageSlabSettings } from './types';

export const TextImageSlab: React.FC<{ data: TextImageSlabData; settings: TextImageSlabSettings }> = ({ data }) => (
  <section
    style={{
      '--local-bg': 'var(--background)',
      '--local-text': 'var(--foreground)',
      '--local-text-muted': 'var(--muted-foreground)',
      '--local-primary': 'var(--primary)',
      '--local-primary-foreground': 'var(--primary-foreground)',
      '--local-border': 'var(--border)',
      '--local-surface': 'var(--card)',
      '--local-radius-lg': 'var(--theme-radius-lg)'
    } as React.CSSProperties}
    className="relative z-0 py-28 bg-[var(--local-bg)]"
  >
    <div className="mx-auto grid max-w-[1200px] gap-0 px-8 lg:grid-cols-[0.9fr_1.1fr]">
      <div className="border border-[var(--local-border)] p-8 md:p-12">
        {data.label && (
          <div className="jp-section-label mb-4 inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-text)]/70" data-jp-field="label">
            <span className="h-px w-5 bg-[var(--local-text)]" />
            {data.label}
          </div>
        )}
        {data.eyebrow && (
          <div className="font-mono text-[0.72rem] uppercase tracking-[0.16em] text-[var(--local-text)]/60" data-jp-field="eyebrow">
            {data.eyebrow}
          </div>
        )}
        <h2 className="mt-6 font-display text-[clamp(2rem,4.5vw,3.8rem)] font-black leading-[1.05] tracking-tight text-[var(--local-text)]" data-jp-field="title">
          {data.title}
        </h2>
        <p className="mt-6 max-w-xl font-primary text-sm text-[var(--local-text-muted)]" data-jp-field="body">
          {data.body}
        </p>
        {data.primaryCta && (
          <Button variant="link" asChild className="mt-8 h-auto p-0 font-mono text-[0.78rem] uppercase tracking-[0.16em] text-[var(--local-text)] no-underline">
            <a href={data.primaryCta.href} data-jp-field="primaryCta">
              {data.primaryCta.label}
              <ArrowRight className="ml-2 h-4 w-4" />
            </a>
          </Button>
        )}
      </div>
      <div className="border-r border-b border-t border-[var(--local-border)]">
        {data.image?.url ? (
          <img src={data.image?.url} alt={data.image?.alt} className="h-full min-h-[420px] w-full object-cover grayscale" />
        ) : (
          <div className="jp-grid-lines min-h-[420px] h-full w-full bg-[var(--local-surface)]" />
        )}
      </div>
    </div>
  </section>
);
