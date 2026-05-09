// Layout: Hero=B (BENTO GRID), Features=A (BENTO)
import React from 'react';
import type { ManifestoGridData, ManifestoGridSettings } from './types';

export const ManifestoGrid: React.FC<{ data: ManifestoGridData; settings: ManifestoGridSettings }> = ({ data }) => (
  <section
    style={{
      '--local-bg': 'var(--background)',
      '--local-text': 'var(--foreground)',
      '--local-text-muted': 'var(--muted-foreground)',
      '--local-primary': 'var(--primary)',
      '--local-border': 'var(--border)',
      '--local-surface': 'var(--card)',
      '--local-radius-lg': 'var(--theme-radius-lg)'
    } as React.CSSProperties}
    className="relative z-0 py-28 bg-[var(--local-bg)]"
  >
    <div className="mx-auto max-w-[1200px] px-8">
      {data.label && (
        <div className="jp-section-label mb-4 inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-text)]/70" data-jp-field="label">
          <span className="h-px w-5 bg-[var(--local-text)]" />
          {data.label}
        </div>
      )}
      <div className="grid gap-8 lg:grid-cols-[0.8fr_1.2fr]">
        <div>
          <h2 className="font-display text-[clamp(2rem,4.5vw,3.8rem)] font-black leading-[1.05] tracking-tight text-[var(--local-text)]" data-jp-field="title">
            {data.title}
          </h2>
          <p className="mt-6 max-w-md font-primary text-sm text-[var(--local-text-muted)]" data-jp-field="intro">
            {data.intro}
          </p>
        </div>
        <div className="grid gap-0 border border-[var(--local-border)] md:grid-cols-2">
          {data.items.map((item, idx) => (
            <div key={item.id || 'legacy-' + idx} className="min-h-[220px] border-b border-r border-[var(--local-border)] p-6 md:p-8" data-jp-item-id={item.id || 'legacy-' + idx} data-jp-item-field="items">
              <div className="font-mono text-[0.72rem] uppercase tracking-[0.16em] text-[var(--local-text)]/60">{item.number}</div>
              <h3 className="mt-8 font-display text-[1.25rem] font-bold leading-tight tracking-tight text-[var(--local-text)]">{item.title}</h3>
              <p className="mt-4 font-primary text-sm text-[var(--local-text-muted)]">{item.body}</p>
            </div>
          ))}
        </div>
      </div>
    </div>
  </section>
);
