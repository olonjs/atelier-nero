// Layout: Hero=F (MINIMAL HERO), Features=B (HORIZONTAL SCROLL)
import React from 'react';
import type { MenuItem } from '@olonjs/core';
import { Button } from '@/components/ui/button';
import {
  NavigationMenu,
  NavigationMenuItem,
  NavigationMenuLink,
  NavigationMenuList
} from '@/components/ui/navigation-menu';
import { Sheet, SheetContent, SheetHeader, SheetTitle, SheetTrigger } from '@/components/ui/sheet';
import { Menu, Moon, Sun } from 'lucide-react';
import type { HeaderData, HeaderSettings } from './types';

function isMenuItemArray(value: unknown): value is MenuItem[] {
  return Array.isArray(value) && value.every((item) => typeof item === 'object' && item !== null && 'label' in item && 'href' in item);
}

export const Header: React.FC<{ data: HeaderData; settings: HeaderSettings; menu: MenuItem[] }> = ({ data, menu }) => {
  const navItems = isMenuItemArray(menu) ? menu : [];
  const [theme, setTheme] = React.useState<'light' | 'dark'>('light');

  React.useEffect(() => {
    if (typeof document === 'undefined') return;
    const current = document.documentElement.getAttribute('data-theme');
    if (current === 'dark' || current === 'light') {
      setTheme(current);
      return;
    }
    const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
    const next = prefersDark ? 'dark' : 'light';
    document.documentElement.setAttribute('data-theme', next);
    setTheme(next);
  }, []);

  const toggleTheme = () => {
    if (typeof document === 'undefined') return;
    const nextTheme = theme === 'dark' ? 'light' : 'dark';
    document.documentElement.setAttribute('data-theme', nextTheme);
    setTheme(nextTheme);
  };

  return (
    <header
      style={{
        '--local-bg': 'var(--background)',
        '--local-text': 'var(--foreground)',
        '--local-border': 'var(--border)',
        '--local-surface': 'var(--background)',
        '--local-primary': 'var(--primary)',
        '--local-primary-foreground': 'var(--primary-foreground)',
        '--local-radius-md': 'var(--theme-radius-md)'
      } as React.CSSProperties}
      className="sticky top-0 z-10 border-b border-[var(--local-border)] bg-[var(--local-bg)]"
    >
      <div className="mx-auto max-w-[1200px] px-8">
        {data.announcement && (
          <div className="border-b border-[var(--local-border)] py-3 font-mono text-[0.68rem] uppercase tracking-[0.2em] text-[var(--local-text)]/70" data-jp-field="announcement">
            {data.announcement}
          </div>
        )}
        <div className="flex h-20 items-center justify-between gap-6">
          <a href="/" className="flex items-baseline gap-3">
            <span className="wordmark text-[1.8rem] leading-none text-[var(--local-text)]" data-jp-field="logoText">
              {data.logoText}
            </span>
            {data.logoHighlight && (
              <span className="font-mono text-[0.68rem] uppercase tracking-[0.2em] text-[var(--local-text)]/60" data-jp-field="logoHighlight">
                {data.logoHighlight}
              </span>
            )}
          </a>

          <div className="hidden items-center gap-3 lg:flex">
            <NavigationMenu>
              <NavigationMenuList className="gap-0">
                {navItems.map((item, idx) => (
                  <NavigationMenuItem key={item.href + '-' + idx}>
                    <NavigationMenuLink href={item.href} className="border-l border-[var(--local-border)] px-4 py-3 font-mono text-[0.72rem] uppercase tracking-[0.16em] text-[var(--local-text)] transition hover:bg-[var(--local-text)] hover:text-[var(--local-bg)]">
                      {item.label}
                    </NavigationMenuLink>
                  </NavigationMenuItem>
                ))}
              </NavigationMenuList>
            </NavigationMenu>
            <Button type="button" variant="outline" onClick={toggleTheme} className="h-11 w-11 rounded-[var(--local-radius-md)] border-[var(--local-border)] bg-transparent text-[var(--local-text)]">
              {theme === 'dark' ? <Sun className="h-4 w-4" /> : <Moon className="h-4 w-4" />}
            </Button>
          </div>

          <div className="flex items-center gap-3 lg:hidden">
            <Button type="button" variant="outline" onClick={toggleTheme} className="h-11 w-11 rounded-[var(--local-radius-md)] border-[var(--local-border)] bg-transparent text-[var(--local-text)]">
              {theme === 'dark' ? <Sun className="h-4 w-4" /> : <Moon className="h-4 w-4" />}
            </Button>
            <Sheet>
              <SheetTrigger asChild>
                <Button variant="outline" className="h-11 w-11 rounded-[var(--local-radius-md)] border-[var(--local-border)] bg-transparent text-[var(--local-text)]">
                  <Menu className="h-4 w-4" />
                </Button>
              </SheetTrigger>
              <SheetContent className="border-[var(--border)] bg-[var(--background)] text-[var(--foreground)]">
                <SheetHeader>
                  <SheetTitle className="font-display text-[var(--foreground)]">Navigation</SheetTitle>
                </SheetHeader>
                <div className="mt-8 flex flex-col border-t border-[var(--border)]">
                  {navItems.map((item, idx) => (
                    <a key={item.href + '-mobile-' + idx} href={item.href} className="border-b border-[var(--border)] py-4 font-mono text-[0.8rem] uppercase tracking-[0.16em] text-[var(--foreground)]">
                      {item.label}
                    </a>
                  ))}
                </div>
              </SheetContent>
            </Sheet>
          </div>
        </div>
      </div>
    </header>
  );
};
