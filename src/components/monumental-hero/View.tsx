// Layout: Hero=D (EDITORIAL), Features=A (BENTO)
import React from 'react';
import { ArrowRight } from 'lucide-react';
import { Button } from '@/components/ui/button';
import type { MonumentalHeroData, MonumentalHeroSettings } from './types';

export const MonumentalHero: React.FC<{ data: MonumentalHeroData; settings: MonumentalHeroSettings }> = ({ data }) => (
  <section
    style={{
      '--local-bg': 'var(--background)',
      '--local-text': 'var(--foreground)',
      '--local-text-muted': 'var(--muted-foreground)',
      '--local-primary': 'var(--primary)',
      '--local-primary-foreground': 'var(--primary-foreground)',
      '--local-border': 'var(--border)',
      '--local-surface': 'var(--card)',
      '--local-radius-md': 'var(--theme-radius-md)',
      '--local-radius-lg': 'var(--theme-radius-lg)'
    } as React.CSSProperties}
    className="relative z-0 min-h-[78vh] border-b border-[var(--local-border)] bg-[var(--local-bg)] py-28"
  >
    <div className="mx-auto grid max-w-[1200px] gap-10 px-8 lg:grid-cols-[1.1fr_0.9fr]">
      <div className="flex flex-col justify-between">
        <div>
          {data.label && (
            <div className="jp-section-label mb-6 inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-text)]/70" data-jp-field="label">
              <span className="h-px w-5 bg-[var(--local-text)]" />
              {data.label}
            </div>
          )}
          <h1 className="font-display text-[clamp(3.4rem,8vw,7.2rem)] font-black leading-[0.92] tracking-tight text-[var(--local-text)] whitespace-pre-line" data-jp-field="title">
            {data.title}
          </h1>
          {data.titleHighlight && (
            <div className="mt-3 font-display text-[clamp(2.2rem,4vw,3.6rem)] italic leading-none tracking-tight text-[var(--local-text)]/70" data-jp-field="titleHighlight">
              {data.titleHighlight}
            </div>
          )}
        </div>

        <div className="mt-12 border-t border-[var(--local-border)] pt-8">
          <p className="max-w-2xl font-primary text-base text-[var(--local-text-muted)]" data-jp-field="description">
            {data.description}
          </p>
          {data.note && (
            <p className="mt-6 font-mono text-[0.72rem] uppercase tracking-[0.16em] text-[var(--local-text)]/65" data-jp-field="note">
              {data.note}
            </p>
          )}
          <div className="mt-8 flex flex-wrap gap-4">
            {data.primaryCta && (
              <Button variant="link" asChild className="h-auto p-0 font-mono text-[0.8rem] uppercase tracking-[0.16em] text-[var(--local-text)] no-underline">
                <a href={data.primaryCta.href} data-jp-field="primaryCta">
                  {data.primaryCta.label}
                  <ArrowRight className="ml-2 h-4 w-4" />
                </a>
              </Button>
            )}
            {data.secondaryCta && (
              <Button variant="link" asChild className="h-auto p-0 font-mono text-[0.8rem] uppercase tracking-[0.16em] text-[var(--local-text)]/60 no-underline">
                <a href={data.secondaryCta.href} data-jp-field="secondaryCta">
                  {data.secondaryCta.label}
                </a>
              </Button>
            )}
          </div>
        </div>
      </div>

      <div className="grid min-h-[520px] grid-rows-[1fr_auto] border-l border-[var(--local-border)] pl-8">
        {data.image?.url ? (
          <img src={data.image?.url} alt={data.image?.alt} className="h-full w-full object-cover grayscale" />
        ) : (
          <div className="jp-grid-lines h-full min-h-[420px] border border-[var(--local-border)] bg-[var(--local-surface)]" />
        )}
        <div className="mt-6 grid grid-cols-2 gap-0 border-t border-[var(--local-border)] text-[0.72rem] uppercase tracking-[0.16em] font-mono text-[var(--local-text)]/70">
          <div className="border-r border-[var(--local-border)] pt-4">Architecture / Interiors</div>
          <div className="pt-4 text-right">Exhibition / Wayfinding</div>
        </div>
      </div>
    </div>
  </section>
);
