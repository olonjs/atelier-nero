// Layout: Hero=E (MAGAZINE), Features=C (TIMELINE)
import React from 'react';
import type { TimelineListData, TimelineListSettings } from './types';

export const TimelineList: React.FC<{ data: TimelineListData; settings: TimelineListSettings }> = ({ data }) => (
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
      <div className="grid gap-8 lg:grid-cols-[0.8fr_1.2fr]">
        <div>
          <h2 className="font-display text-[clamp(2rem,4.5vw,3.8rem)] font-black leading-[1.05] tracking-tight text-[var(--local-text)]" data-jp-field="title">
            {data.title}
          </h2>
          <p className="mt-6 max-w-md font-primary text-sm text-[var(--local-text-muted)]" data-jp-field="intro">
            {data.intro}
          </p>
        </div>
        <div className="border-l border-[var(--local-border)] pl-6 md:pl-10">
          {data.items.map((item, idx) => (
            <div key={item.id || 'legacy-' + idx} className="grid gap-4 border-t border-[var(--local-border)] py-8 md:grid-cols-[120px_1fr]" data-jp-item-id={item.id || 'legacy-' + idx} data-jp-item-field="items">
              <div className="font-mono text-[0.72rem] uppercase tracking-[0.16em] text-[var(--local-text)]/60">{item.year}</div>
              <div>
                <h3 className="font-display text-[1.2rem] font-bold leading-tight tracking-tight text-[var(--local-text)]">{item.title}</h3>
                <p className="mt-3 max-w-2xl font-primary text-sm text-[var(--local-text-muted)]">{item.body}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  </section>
);
