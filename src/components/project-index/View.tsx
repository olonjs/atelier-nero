// Layout: Hero=E (MAGAZINE), Features=C (TIMELINE)
import React from 'react';
import { ArrowUpRight } from 'lucide-react';
import type { ProjectIndexData, ProjectIndexSettings } from './types';

export const ProjectIndex: React.FC<{ data: ProjectIndexData; settings: ProjectIndexSettings }> = ({ data }) => (
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
    className="relative z-0 border-t border-[var(--local-border)] py-28 bg-[var(--local-bg)]"
  >
    <div className="mx-auto max-w-[1200px] px-8">
      {data.label && (
        <div className="jp-section-label mb-4 inline-flex items-center gap-2 text-[0.72rem] font-bold uppercase tracking-[0.12em] text-[var(--local-text)]/70" data-jp-field="label">
          <span className="h-px w-5 bg-[var(--local-text)]" />
          {data.label}
        </div>
      )}
      <div className="grid gap-8 lg:grid-cols-[0.7fr_1.3fr]">
        <div>
          <h2 className="font-display text-[clamp(2rem,4.5vw,3.8rem)] font-black leading-[1.05] tracking-tight text-[var(--local-text)]" data-jp-field="title">
            {data.title}
          </h2>
          <p className="mt-6 max-w-md font-primary text-sm text-[var(--local-text-muted)]" data-jp-field="intro">
            {data.intro}
          </p>
        </div>
        <div className="border-t border-[var(--local-border)]">
          {data.items.map((item, idx) => (
            <a key={item.id || 'legacy-' + idx} href={item.href} className="grid gap-6 border-b border-[var(--local-border)] py-8 md:grid-cols-[120px_1fr_240px]" data-jp-item-id={item.id || 'legacy-' + idx} data-jp-item-field="items">
              <div className="font-mono text-[0.72rem] uppercase tracking-[0.16em] text-[var(--local-text)]/60">
                <div>{item.year}</div>
                <div className="mt-2">{item.location}</div>
              </div>
              <div>
                <div className="font-mono text-[0.72rem] uppercase tracking-[0.16em] text-[var(--local-text)]/60">{item.category}</div>
                <h3 className="mt-2 font-display text-[1.5rem] font-bold leading-tight tracking-tight text-[var(--local-text)]">{item.title}</h3>
                <p className="mt-3 max-w-2xl font-primary text-sm text-[var(--local-text-muted)]">{item.body}</p>
              </div>
              <div className="flex items-start justify-between gap-4">
                {item.image?.url ? (
                  <img src={item.image?.url} alt={item.image?.alt} className="h-28 w-36 object-cover grayscale" />
                ) : (
                  <div className="jp-grid-lines h-28 w-36 border border-[var(--local-border)] bg-[var(--local-surface)]" />
                )}
                <ArrowUpRight className="mt-1 h-5 w-5 text-[var(--local-text)]" />
              </div>
            </a>
          ))}
        </div>
      </div>
    </div>
  </section>
);
