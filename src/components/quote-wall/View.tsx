// Layout: Hero=B (BENTO GRID), Features=A (BENTO)
import React from 'react';
import type { QuoteWallData, QuoteWallSettings } from './types';

export const QuoteWall: React.FC<{ data: QuoteWallData; settings: QuoteWallSettings }> = ({ data }) => (
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
      <h2 className="max-w-4xl font-display text-[clamp(2rem,4.5vw,3.8rem)] font-black leading-[1.05] tracking-tight text-[var(--local-text)]" data-jp-field="title">
        {data.title}
      </h2>
      <div className="mt-10 grid gap-0 border border-[var(--local-border)] lg:grid-cols-3">
        {data.items.map((item, idx) => (
          <div key={item.id || 'legacy-' + idx} className="flex min-h-[280px] flex-col justify-between border-b border-r border-[var(--local-border)] p-8" data-jp-item-id={item.id || 'legacy-' + idx} data-jp-item-field="items">
            <p className="font-display text-[1.6rem] leading-[1.2] tracking-tight text-[var(--local-text)]">{item.quote}</p>
            <div className="mt-10">
              <div className="font-primary text-sm text-[var(--local-text)]">{item.author}</div>
              <div className="font-mono text-[0.68rem] uppercase tracking-[0.16em] text-[var(--local-text)]/60">{item.role}</div>
            </div>
          </div>
        ))}
      </div>
    </div>
  </section>
);
