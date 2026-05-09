// Layout: Hero=E (MAGAZINE), Features=A (BENTO)
import React from 'react';
import type { MenuItem } from '@olonjs/core';
import { Separator } from '@/components/ui/separator';
import type { FooterData, FooterSettings } from './types';

function isMenuItemArray(value: unknown): value is MenuItem[] {
  return Array.isArray(value) && value.every((item) => typeof item === 'object' && item !== null && 'label' in item && 'href' in item);
}

export const Footer: React.FC<{ data: FooterData; settings: FooterSettings; menu?: MenuItem[] }> = ({ data, menu }) => {
  const navItems = isMenuItemArray(menu) ? menu : [];

  return (
    <footer
      style={{
        '--local-bg': 'var(--background)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-border': 'var(--border)',
        '--local-primary': 'var(--primary)',
        '--local-radius-lg': 'var(--theme-radius-lg)'
      } as React.CSSProperties}
      className="relative z-0 border-t border-[var(--local-border)] bg-[var(--local-bg)] py-20"
    >
      <div className="mx-auto max-w-[1200px] px-8">
        <div className="grid gap-10 lg:grid-cols-[1.3fr_0.9fr_0.8fr]">
          <div>
            <div className="flex items-baseline gap-3">
              <span className="wordmark text-4xl leading-none text-[var(--local-text)]" data-jp-field="brandText">
                {data.brandText}
              </span>
              {data.brandHighlight && (
                <span className="font-mono text-[0.68rem] uppercase tracking-[0.2em] text-[var(--local-text)]/60" data-jp-field="brandHighlight">
                  {data.brandHighlight}
                </span>
              )}
            </div>
            <p className="mt-6 max-w-xl font-primary text-sm text-[var(--local-text-muted)]">
              Architecture, exhibition systems, interiors, signage, and spatial identity built through exacting proportion, structural clarity, and disciplined material language.
            </p>
          </div>
          <div>
            <h3 className="font-display text-lg font-bold tracking-tight text-[var(--local-text)]">Visit</h3>
            <p className="mt-4 whitespace-pre-line font-primary text-sm text-[var(--local-text-muted)]" data-jp-field="address">
              {data.address}
            </p>
          </div>
          <div>
            <h3 className="font-display text-lg font-bold tracking-tight text-[var(--local-text)]">Contact</h3>
            <p className="mt-4 font-primary text-sm text-[var(--local-text-muted)]" data-jp-field="phone">{data.phone}</p>
            <p className="font-primary text-sm text-[var(--local-text-muted)]" data-jp-field="email">{data.email}</p>
          </div>
        </div>

        <Separator className="my-8 bg-[var(--local-border)]" />

        <div className="flex flex-col gap-6 lg:flex-row lg:items-end lg:justify-between">
          <div className="flex flex-wrap gap-x-6 gap-y-3">
            {navItems.map((item, idx) => (
              <a key={item.href + '-footer-' + idx} href={item.href} className="font-mono text-[0.72rem] uppercase tracking-[0.16em] text-[var(--local-text-muted)] transition hover:text-[var(--local-text)]">
                {item.label}
              </a>
            ))}
          </div>
          <p className="font-mono text-[0.68rem] uppercase tracking-[0.16em] text-[var(--local-text-muted)]" data-jp-field="copyright">
            {data.copyright}
          </p>
        </div>
      </div>
    </footer>
  );
};
