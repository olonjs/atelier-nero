#!/bin/bash
set -e

echo "==============================================="
echo "   OLONJS TENANT GENERATOR — ATELIER NERO"
echo "==============================================="

# -----------------------------------------------------------------------------
# 0. SHADCN/UI INIT
# -----------------------------------------------------------------------------
echo "-- Step 0: shadcn/ui init..."

npm install class-variance-authority clsx tailwind-merge lucide-react

npx shadcn@latest init --yes --style new-york --base-color slate 2>/dev/null || true

npx shadcn@latest add --yes --overwrite \
  button \
  card \
  badge \
  separator \
  avatar \
  table \
  tabs \
  accordion \
  dialog \
  sheet \
  tooltip \
  navigation-menu \
  dropdown-menu \
  hover-card \
  breadcrumb \
  skeleton \
  progress \
  input \
  label \
  textarea \
  select \
  checkbox \
  switch \
  toggle \
  toggle-group \
  scroll-area \
  aspect-ratio

echo "   shadcn/ui components installed"

mkdir -p \
  src/components/header \
  src/components/footer \
  src/components/monumental-hero \
  src/components/manifesto-grid \
  src/components/project-index \
  src/components/text-image-slab \
  src/components/timeline-list \
  src/components/faq-section \
  src/components/contact-strip \
  src/components/quote-wall \
  src/lib \
  src/data/config \
  src/data/pages

echo "-- Writing index.html..."
cat > index.html << 'EOF'
<!doctype html>
<html lang="en" data-theme="light">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Atelier Nero — Architecture, Exhibition Systems, Spatial Direction</title>
    <meta
      name="description"
      content="Atelier Nero is a radical architecture and exhibition design practice shaping buildings, interiors, installations, and cultural wayfinding systems with severe precision."
    />
    <meta
      name="keywords"
      content="architecture studio, exhibition design, wayfinding, spatial identity, brutalist design, modernist architecture"
    />
  </head>
  <body>
    <div id="root"></div>
    <script type="module" src="/src/main.tsx"></script>
  </body>
</html>
EOF

echo "-- Writing src/index.css..."
cat > src/index.css << 'EOF'
@import url('https://fonts.googleapis.com/css2?family=Manrope:wght@400;500;600;700;800&family=Playfair+Display:wght@400;500;600;700;800&family=IBM+Plex+Mono:wght@400;500;600;700;800&display=swap');

/* Typography contract: import this before any other CSS rules. */
@import "tailwindcss";
@source "./**/*.tsx";

@theme {
  --color-background: var(--background);
  --color-foreground: var(--foreground);
  --color-card: var(--card);
  --color-card-foreground: var(--card-foreground);
  --color-primary: var(--primary);
  --color-primary-foreground: var(--primary-foreground);
  --color-secondary: var(--secondary);
  --color-secondary-foreground: var(--secondary-foreground);
  --color-muted: var(--muted);
  --color-muted-foreground: var(--muted-foreground);
  --color-accent: var(--accent);
  --color-border: var(--border);
  --radius-lg: var(--theme-radius-lg);
  --radius-md: var(--theme-radius-md);
  --radius-sm: var(--theme-radius-sm);
  --font-primary: var(--theme-font-primary);
  --font-mono: var(--theme-font-mono);
  --font-display: var(--theme-font-display);
}

:root {
  --theme-font-primary: var(--theme-typography-font-family-primary);
  --theme-font-mono: var(--theme-typography-font-family-mono);
  --theme-font-display: var(--theme-typography-font-family-display);
  --theme-radius-sm: var(--theme-border-radius-sm);
  --theme-radius-md: var(--theme-border-radius-md);
  --theme-radius-lg: var(--theme-border-radius-lg);

  --background: var(--theme-modes-light-colors-background, var(--theme-colors-background));
  --foreground: var(--theme-modes-light-colors-foreground, var(--theme-colors-foreground));
  --card: var(--theme-modes-light-colors-card, var(--theme-colors-card));
  --card-foreground: var(--theme-modes-light-colors-card-foreground, var(--theme-colors-card-foreground));
  --elevated: var(--theme-modes-light-colors-elevated, var(--theme-colors-elevated));
  --overlay: var(--theme-modes-light-colors-overlay, var(--theme-colors-overlay));
  --primary: var(--theme-modes-light-colors-primary, var(--theme-colors-primary));
  --primary-foreground: var(--theme-modes-light-colors-primary-foreground, var(--theme-colors-primary-foreground));
  --primary-light: var(--theme-modes-light-colors-primary-light, var(--theme-colors-primary-light));
  --primary-dark: var(--theme-modes-light-colors-primary-dark, var(--theme-colors-primary-dark));
  --secondary: var(--theme-modes-light-colors-secondary, var(--theme-colors-secondary));
  --secondary-foreground: var(--theme-modes-light-colors-secondary-foreground, var(--theme-colors-secondary-foreground));
  --muted: var(--theme-modes-light-colors-muted, var(--theme-colors-muted));
  --muted-foreground: var(--theme-modes-light-colors-muted-foreground, var(--theme-colors-muted-foreground));
  --accent: var(--theme-modes-light-colors-accent, var(--theme-colors-accent));
  --accent-foreground: var(--theme-modes-light-colors-accent-foreground, var(--theme-colors-accent-foreground));
  --border: var(--theme-modes-light-colors-border, var(--theme-colors-border));
  --border-strong: var(--theme-modes-light-colors-border-strong, var(--theme-colors-border-strong));
  --input: var(--theme-modes-light-colors-input, var(--theme-colors-input));
  --ring: var(--theme-modes-light-colors-ring, var(--theme-colors-ring));
  --destructive: var(--theme-colors-destructive);
  --destructive-foreground: var(--theme-colors-destructive-foreground);
  --success: var(--theme-colors-success);
  --success-foreground: var(--theme-colors-success-foreground);
  --warning: var(--theme-colors-warning);
  --warning-foreground: var(--theme-colors-warning-foreground);
  --info: var(--theme-colors-info);
  --info-foreground: var(--theme-colors-info-foreground);
  --radius: var(--theme-radius-lg);

  --demo-surface: color-mix(in oklch, var(--card) 92%, var(--background));
  --demo-surface-soft: color-mix(in oklch, var(--card) 84%, var(--background));
  --demo-surface-strong: color-mix(in oklch, var(--foreground) 8%, var(--background));
  --demo-surface-deep: color-mix(in oklch, var(--foreground) 14%, var(--background));
  --demo-border-soft: color-mix(in oklch, var(--foreground) 18%, transparent);
  --demo-border-strong: color-mix(in oklch, var(--foreground) 34%, transparent);
  --demo-accent-soft: color-mix(in oklch, var(--foreground) 6%, transparent);
  --demo-accent-strong: color-mix(in oklch, var(--foreground) 14%, transparent);
  --demo-text-soft: color-mix(in oklch, var(--foreground) 76%, var(--muted-foreground));
  --demo-text-faint: color-mix(in oklch, var(--foreground) 44%, transparent);
}

[data-theme='dark'] {
  --background: var(--theme-modes-dark-colors-background, var(--background));
  --foreground: var(--theme-modes-dark-colors-foreground, var(--foreground));
  --card: var(--theme-modes-dark-colors-card, var(--card));
  --card-foreground: var(--theme-modes-dark-colors-card-foreground, var(--card-foreground));
  --elevated: var(--theme-modes-dark-colors-elevated, var(--elevated));
  --overlay: var(--theme-modes-dark-colors-overlay, var(--overlay));
  --primary: var(--theme-modes-dark-colors-primary, var(--primary));
  --primary-foreground: var(--theme-modes-dark-colors-primary-foreground, var(--primary-foreground));
  --primary-light: var(--theme-modes-dark-colors-primary-light, var(--primary-light));
  --primary-dark: var(--theme-modes-dark-colors-primary-dark, var(--primary-dark));
  --secondary: var(--theme-modes-dark-colors-secondary, var(--secondary));
  --secondary-foreground: var(--theme-modes-dark-colors-secondary-foreground, var(--secondary-foreground));
  --muted: var(--theme-modes-dark-colors-muted, var(--muted));
  --muted-foreground: var(--theme-modes-dark-colors-muted-foreground, var(--muted-foreground));
  --accent: var(--theme-modes-dark-colors-accent, var(--accent));
  --accent-foreground: var(--theme-modes-dark-colors-accent-foreground, var(--accent-foreground));
  --border: var(--theme-modes-dark-colors-border, var(--border));
  --border-strong: var(--theme-modes-dark-colors-border-strong, var(--border-strong));
  --input: var(--theme-modes-dark-colors-input, var(--input));
  --ring: var(--theme-modes-dark-colors-ring, var(--ring));
}

@layer base {
  * { border-color: var(--border); }
  html { scroll-behavior: smooth; }
  body {
    background-color: var(--background);
    color: var(--foreground);
    font-family: var(--theme-font-primary);
    line-height: 1.7;
    overflow-x: hidden;
    @apply antialiased;
  }
  a { color: inherit; text-decoration: none; }
}

.font-display { font-family: var(--theme-font-display); }
.font-primary { font-family: var(--theme-font-primary); }
.font-mono { font-family: var(--theme-font-mono); }

.wordmark {
  font-family: "Playfair Display", Helvetica, Arial, sans-serif;
  font-weight: 700;
  letter-spacing: -0.06em;
}

.jp-grid-lines {
  background-image:
    linear-gradient(to right, color-mix(in oklch, var(--foreground) 8%, transparent) 1px, transparent 1px),
    linear-gradient(to bottom, color-mix(in oklch, var(--foreground) 8%, transparent) 1px, transparent 1px);
  background-size: 64px 64px;
}

.jp-section-label {
  font-family: var(--theme-font-mono);
}

@keyframes jp-fadeUp {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

.jp-animate-in { opacity: 0; animation: jp-fadeUp 0.7s ease forwards; }
.jp-d1 { animation-delay: 0.1s; }
.jp-d2 { animation-delay: 0.2s; }
.jp-d3 { animation-delay: 0.3s; }
.jp-d4 { animation-delay: 0.4s; }

@keyframes jp-pulseDot {
  0%, 100% { opacity: 1; transform: scale(1); }
  50% { opacity: 0.5; transform: scale(0.85); }
}

.jp-pulse-dot { animation: jp-pulseDot 2s ease infinite; }

[data-jp-section-overlay] {
  position: absolute;
  inset: 0;
  z-index: 9999;
  pointer-events: none;
  border: 2px solid transparent;
  transition: border-color 0.15s, background-color 0.15s;
}

[data-section-id]:hover [data-jp-section-overlay] {
  border: 2px dashed color-mix(in oklch, var(--primary) 50%, transparent);
  background-color: color-mix(in oklch, var(--primary) 6%, transparent);
}

[data-section-id][data-jp-selected] [data-jp-section-overlay] {
  border: 2px solid var(--primary);
  background-color: color-mix(in oklch, var(--primary) 10%, transparent);
}

[data-jp-section-overlay] > div {
  position: absolute;
  top: 0;
  right: 0;
  padding: 0.2rem 0.55rem;
  font-size: 9px;
  font-weight: 800;
  text-transform: uppercase;
  letter-spacing: 0.1em;
  background: var(--primary);
  color: var(--primary-foreground);
  opacity: 0;
  transition: opacity 0.15s;
}

[data-section-id]:hover [data-jp-section-overlay] > div,
[data-section-id][data-jp-selected] [data-jp-section-overlay] > div {
  opacity: 1;
}
EOF

echo "-- Writing theme and config data..."
cat > src/data/config/theme.json << 'EOF'
{
  "name": "Atelier Nero",
  "tokens": {
    "colors": {
      "background": "#f5f5f2",
      "foreground": "#111111",
      "card": "#ecece7",
      "card-foreground": "#111111",
      "elevated": "#ffffff",
      "overlay": "rgba(0,0,0,0.72)",
      "primary": "#111111",
      "primary-foreground": "#f5f5f2",
      "primary-light": "#5f5f5f",
      "primary-dark": "#000000",
      "accent": "#2e2e2e",
      "accent-foreground": "#f5f5f2",
      "secondary": "#d9d9d2",
      "secondary-foreground": "#111111",
      "muted": "#e6e6e0",
      "muted-foreground": "#5c5c57",
      "border": "#bdbdb6",
      "border-strong": "#70706a",
      "input": "#efefea",
      "ring": "#111111",
      "destructive": "#6f1d1b",
      "destructive-foreground": "#ffffff",
      "success": "#1f5130",
      "success-foreground": "#ffffff",
      "warning": "#7a5b12",
      "warning-foreground": "#ffffff",
      "info": "#1f3f60",
      "info-foreground": "#ffffff"
    },
    "typography": {
      "fontFamily": {
        "primary": "\"Manrope\", Helvetica, Arial, sans-serif",
        "mono": "\"IBM Plex Mono\", Helvetica, Arial, sans-serif",
        "display": "\"Playfair Display\", Helvetica, Arial, sans-serif"
      },
      "wordmark": {
        "fontFamily": "\"Playfair Display\", Helvetica, Arial, sans-serif",
        "weight": "700",
        "tracking": "-0.06em"
      }
    },
    "borderRadius": {
      "sm": "0px",
      "md": "0px",
      "lg": "0px",
      "xl": "0px",
      "full": "0px"
    },
    "spacing": {
      "container-max": "1200px",
      "section-y": "112px",
      "header-h": "80px",
      "sidebar-w": "240px"
    },
    "zIndex": {
      "base": "0",
      "elevated": "10",
      "dropdown": "100",
      "sticky": "200",
      "overlay": "300",
      "modal": "400",
      "toast": "500"
    },
    "modes": {
      "light": {
        "colors": {
          "background": "#f5f5f2",
          "foreground": "#111111",
          "card": "#ecece7",
          "card-foreground": "#111111",
          "elevated": "#ffffff",
          "overlay": "rgba(0,0,0,0.72)",
          "primary": "#111111",
          "primary-foreground": "#f5f5f2",
          "primary-light": "#5f5f5f",
          "primary-dark": "#000000",
          "accent": "#2e2e2e",
          "accent-foreground": "#f5f5f2",
          "secondary": "#d9d9d2",
          "secondary-foreground": "#111111",
          "muted": "#e6e6e0",
          "muted-foreground": "#5c5c57",
          "border": "#bdbdb6",
          "border-strong": "#70706a",
          "input": "#efefea",
          "ring": "#111111"
        }
      },
      "dark": {
        "colors": {
          "background": "#090909",
          "foreground": "#f0f0eb",
          "card": "#111111",
          "card-foreground": "#f0f0eb",
          "elevated": "#151515",
          "overlay": "rgba(0,0,0,0.8)",
          "primary": "#f0f0eb",
          "primary-foreground": "#090909",
          "primary-light": "#b7b7af",
          "primary-dark": "#ffffff",
          "accent": "#d8d8d2",
          "accent-foreground": "#090909",
          "secondary": "#1a1a1a",
          "secondary-foreground": "#f0f0eb",
          "muted": "#121212",
          "muted-foreground": "#a5a59e",
          "border": "#343434",
          "border-strong": "#707070",
          "input": "#111111",
          "ring": "#f0f0eb"
        }
      }
    }
  }
}
EOF

cat > src/data/config/menu.json << 'EOF'
{
  "main": [
    { "label": "Practice", "href": "/about" },
    { "label": "Projects", "href": "/projects" },
    { "label": "Contact", "href": "/contact", "isCta": true }
  ],
  "footer": [
    { "label": "Practice", "href": "/about" },
    { "label": "Projects", "href": "/projects" },
    { "label": "Contact", "href": "/contact" }
  ]
}
EOF

cat > src/data/config/site.json << 'EOF'
{
  "header": {
    "id": "global-header",
    "type": "header",
    "data": {
      "announcement": "Rome / Milan / International commissions",
      "logoText": "Atelier Nero",
      "logoHighlight": "Spatial Systems",
      "menu": { "$ref": "../config/menu.json#/main" }
    },
    "settings": { "sticky": true }
  },
  "footer": {
    "id": "global-footer",
    "type": "footer",
    "data": {
      "brandText": "Atelier Nero",
      "brandHighlight": "Studio",
      "address": "Via del Porto 18\n00154 Rome\nItaly",
      "phone": "+39 06 9485 2210",
      "email": "studio@ateliernero.it",
      "copyright": "© 2026 Atelier Nero. All rights reserved.",
      "menu": { "$ref": "../config/menu.json#/footer" }
    },
    "settings": { "showLogo": true }
  },
  "identity": {
    "title": "Atelier Nero"
  },
  "pages": []
}
EOF

echo "-- Writing capsule: header..."
cat > src/components/header/schema.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionData, BaseArrayItem } from '@/lib/base-schemas';

const MenuItemSchema = BaseArrayItem.extend({
  label: z.string().describe('ui:text'),
  href: z.string().describe('ui:text'),
  isCta: z.boolean().optional().describe('ui:checkbox')
});

export const HeaderSchema = BaseSectionData.extend({
  announcement: z.string().optional().describe('ui:text'),
  logoText: z.string().describe('ui:text'),
  logoHighlight: z.string().optional().describe('ui:text'),
  menu: z.array(MenuItemSchema).optional().describe('ui:list')
});
EOF

cat > src/components/header/types.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { HeaderSchema } from './schema';

export type HeaderData = z.infer<typeof HeaderSchema>;
export type HeaderSettings = z.infer<typeof BaseSectionSettingsSchema>;
EOF

cat > src/components/header/View.tsx << 'EOF'
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
EOF

cat > src/components/header/index.ts << 'EOF'
export { Header } from './View';
export { HeaderSchema } from './schema';
export type { HeaderData, HeaderSettings } from './types';
EOF

echo "-- Writing capsule: footer..."
cat > src/components/footer/schema.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionData, BaseArrayItem } from '@/lib/base-schemas';

const MenuItemSchema = BaseArrayItem.extend({
  label: z.string().describe('ui:text'),
  href: z.string().describe('ui:text'),
  isCta: z.boolean().optional().describe('ui:checkbox')
});

export const FooterSchema = BaseSectionData.extend({
  brandText: z.string().describe('ui:text'),
  brandHighlight: z.string().optional().describe('ui:text'),
  address: z.string().describe('ui:textarea'),
  phone: z.string().describe('ui:text'),
  email: z.string().describe('ui:text'),
  copyright: z.string().describe('ui:text'),
  menu: z.array(MenuItemSchema).optional().describe('ui:list')
});
EOF

cat > src/components/footer/types.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { FooterSchema } from './schema';

export type FooterData = z.infer<typeof FooterSchema>;
export type FooterSettings = z.infer<typeof BaseSectionSettingsSchema>;
EOF

cat > src/components/footer/View.tsx << 'EOF'
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
EOF

cat > src/components/footer/index.ts << 'EOF'
export { Footer } from './View';
export { FooterSchema } from './schema';
export type { FooterData, FooterSettings } from './types';
EOF

echo "-- Writing capsule: monumental-hero..."
cat > src/components/monumental-hero/schema.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionData, CtaSchema, ImageSelectionSchema } from '@/lib/base-schemas';

export const MonumentalHeroSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:textarea'),
  titleHighlight: z.string().optional().describe('ui:text'),
  description: z.string().describe('ui:textarea'),
  primaryCta: CtaSchema.optional(),
  secondaryCta: CtaSchema.optional(),
  image: ImageSelectionSchema.optional(),
  note: z.string().optional().describe('ui:text')
});
EOF

cat > src/components/monumental-hero/types.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { MonumentalHeroSchema } from './schema';

export type MonumentalHeroData = z.infer<typeof MonumentalHeroSchema>;
export type MonumentalHeroSettings = z.infer<typeof BaseSectionSettingsSchema>;
EOF

cat > src/components/monumental-hero/View.tsx << 'EOF'
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
EOF

cat > src/components/monumental-hero/index.ts << 'EOF'
export { MonumentalHero } from './View';
export { MonumentalHeroSchema } from './schema';
export type { MonumentalHeroData, MonumentalHeroSettings } from './types';
EOF

echo "-- Writing capsule: manifesto-grid..."
cat > src/components/manifesto-grid/schema.ts << 'EOF'
import { z } from 'zod';
import { BaseArrayItem, BaseSectionData } from '@/lib/base-schemas';

const ManifestoItemSchema = BaseArrayItem.extend({
  number: z.string().describe('ui:text'),
  title: z.string().describe('ui:text'),
  body: z.string().describe('ui:textarea')
});

export const ManifestoGridSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  intro: z.string().describe('ui:textarea'),
  items: z.array(ManifestoItemSchema).describe('ui:list')
});
EOF

cat > src/components/manifesto-grid/types.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { ManifestoGridSchema } from './schema';

export type ManifestoGridData = z.infer<typeof ManifestoGridSchema>;
export type ManifestoGridSettings = z.infer<typeof BaseSectionSettingsSchema>;
EOF

cat > src/components/manifesto-grid/View.tsx << 'EOF'
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
EOF

cat > src/components/manifesto-grid/index.ts << 'EOF'
export { ManifestoGrid } from './View';
export { ManifestoGridSchema } from './schema';
export type { ManifestoGridData, ManifestoGridSettings } from './types';
EOF

echo "-- Writing capsule: project-index..."
cat > src/components/project-index/schema.ts << 'EOF'
import { z } from 'zod';
import { BaseArrayItem, BaseSectionData, ImageSelectionSchema } from '@/lib/base-schemas';

const ProjectItemSchema = BaseArrayItem.extend({
  year: z.string().describe('ui:text'),
  title: z.string().describe('ui:text'),
  category: z.string().describe('ui:text'),
  location: z.string().describe('ui:text'),
  body: z.string().describe('ui:textarea'),
  href: z.string().describe('ui:text'),
  image: ImageSelectionSchema.optional()
});

export const ProjectIndexSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  intro: z.string().describe('ui:textarea'),
  items: z.array(ProjectItemSchema).describe('ui:list')
});
EOF

cat > src/components/project-index/types.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { ProjectIndexSchema } from './schema';

export type ProjectIndexData = z.infer<typeof ProjectIndexSchema>;
export type ProjectIndexSettings = z.infer<typeof BaseSectionSettingsSchema>;
EOF

cat > src/components/project-index/View.tsx << 'EOF'
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
EOF

cat > src/components/project-index/index.ts << 'EOF'
export { ProjectIndex } from './View';
export { ProjectIndexSchema } from './schema';
export type { ProjectIndexData, ProjectIndexSettings } from './types';
EOF

echo "-- Writing capsule: text-image-slab..."
cat > src/components/text-image-slab/schema.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionData, CtaSchema, ImageSelectionSchema } from '@/lib/base-schemas';

export const TextImageSlabSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  body: z.string().describe('ui:textarea'),
  eyebrow: z.string().optional().describe('ui:text'),
  image: ImageSelectionSchema.optional(),
  primaryCta: CtaSchema.optional()
});
EOF

cat > src/components/text-image-slab/types.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { TextImageSlabSchema } from './schema';

export type TextImageSlabData = z.infer<typeof TextImageSlabSchema>;
export type TextImageSlabSettings = z.infer<typeof BaseSectionSettingsSchema>;
EOF

cat > src/components/text-image-slab/View.tsx << 'EOF'
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
EOF

cat > src/components/text-image-slab/index.ts << 'EOF'
export { TextImageSlab } from './View';
export { TextImageSlabSchema } from './schema';
export type { TextImageSlabData, TextImageSlabSettings } from './types';
EOF

echo "-- Writing capsule: timeline-list..."
cat > src/components/timeline-list/schema.ts << 'EOF'
import { z } from 'zod';
import { BaseArrayItem, BaseSectionData } from '@/lib/base-schemas';

const TimelineItemSchema = BaseArrayItem.extend({
  year: z.string().describe('ui:text'),
  title: z.string().describe('ui:text'),
  body: z.string().describe('ui:textarea')
});

export const TimelineListSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  intro: z.string().describe('ui:textarea'),
  items: z.array(TimelineItemSchema).describe('ui:list')
});
EOF

cat > src/components/timeline-list/types.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { TimelineListSchema } from './schema';

export type TimelineListData = z.infer<typeof TimelineListSchema>;
export type TimelineListSettings = z.infer<typeof BaseSectionSettingsSchema>;
EOF

cat > src/components/timeline-list/View.tsx << 'EOF'
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
EOF

cat > src/components/timeline-list/index.ts << 'EOF'
export { TimelineList } from './View';
export { TimelineListSchema } from './schema';
export type { TimelineListData, TimelineListSettings } from './types';
EOF

echo "-- Writing capsule: faq-section..."
cat > src/components/faq-section/schema.ts << 'EOF'
import { z } from 'zod';
import { BaseArrayItem, BaseSectionData } from '@/lib/base-schemas';

const FaqItemSchema = BaseArrayItem.extend({
  question: z.string().describe('ui:text'),
  answer: z.string().describe('ui:textarea')
});

export const FaqSectionSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  intro: z.string().describe('ui:textarea'),
  items: z.array(FaqItemSchema).describe('ui:list')
});
EOF

cat > src/components/faq-section/types.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { FaqSectionSchema } from './schema';

export type FaqSectionData = z.infer<typeof FaqSectionSchema>;
export type FaqSectionSettings = z.infer<typeof BaseSectionSettingsSchema>;
EOF

cat > src/components/faq-section/View.tsx << 'EOF'
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
EOF

cat > src/components/faq-section/index.ts << 'EOF'
export { FaqSection } from './View';
export { FaqSectionSchema } from './schema';
export type { FaqSectionData, FaqSectionSettings } from './types';
EOF

echo "-- Writing capsule: contact-strip..."
cat > src/components/contact-strip/schema.ts << 'EOF'
import { z } from 'zod';
import { BaseArrayItem, BaseSectionData, CtaSchema } from '@/lib/base-schemas';

const DetailItemSchema = BaseArrayItem.extend({
  label: z.string().describe('ui:text'),
  value: z.string().describe('ui:text')
});

export const ContactStripSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  description: z.string().describe('ui:textarea'),
  details: z.array(DetailItemSchema).describe('ui:list'),
  primaryCta: CtaSchema.optional()
});
EOF

cat > src/components/contact-strip/types.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { ContactStripSchema } from './schema';

export type ContactStripData = z.infer<typeof ContactStripSchema>;
export type ContactStripSettings = z.infer<typeof BaseSectionSettingsSchema>;
EOF

cat > src/components/contact-strip/View.tsx << 'EOF'
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
EOF

cat > src/components/contact-strip/index.ts << 'EOF'
export { ContactStrip } from './View';
export { ContactStripSchema } from './schema';
export type { ContactStripData, ContactStripSettings } from './types';
EOF

echo "-- Writing capsule: quote-wall..."
cat > src/components/quote-wall/schema.ts << 'EOF'
import { z } from 'zod';
import { BaseArrayItem, BaseSectionData } from '@/lib/base-schemas';

const QuoteItemSchema = BaseArrayItem.extend({
  quote: z.string().describe('ui:textarea'),
  author: z.string().describe('ui:text'),
  role: z.string().describe('ui:text')
});

export const QuoteWallSchema = BaseSectionData.extend({
  label: z.string().optional().describe('ui:text'),
  title: z.string().describe('ui:text'),
  items: z.array(QuoteItemSchema).describe('ui:list')
});
EOF

cat > src/components/quote-wall/types.ts << 'EOF'
import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { QuoteWallSchema } from './schema';

export type QuoteWallData = z.infer<typeof QuoteWallSchema>;
export type QuoteWallSettings = z.infer<typeof BaseSectionSettingsSchema>;
EOF

cat > src/components/quote-wall/View.tsx << 'EOF'
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
EOF

cat > src/components/quote-wall/index.ts << 'EOF'
export { QuoteWall } from './View';
export { QuoteWallSchema } from './schema';
export type { QuoteWallData, QuoteWallSettings } from './types';
EOF

echo "-- Writing src/types.ts..."
cat > src/types.ts << 'EOF'
import type { MenuItem } from '@olonjs/core';

import type { HeaderData, HeaderSettings } from '@/components/header';
import type { FooterData, FooterSettings } from '@/components/footer';
import type { MonumentalHeroData, MonumentalHeroSettings } from '@/components/monumental-hero';
import type { ManifestoGridData, ManifestoGridSettings } from '@/components/manifesto-grid';
import type { ProjectIndexData, ProjectIndexSettings } from '@/components/project-index';
import type { TextImageSlabData, TextImageSlabSettings } from '@/components/text-image-slab';
import type { TimelineListData, TimelineListSettings } from '@/components/timeline-list';
import type { FaqSectionData, FaqSectionSettings } from '@/components/faq-section';
import type { ContactStripData, ContactStripSettings } from '@/components/contact-strip';
import type { QuoteWallData, QuoteWallSettings } from '@/components/quote-wall';

export type SectionComponentPropsMap = {
  'header': { data: HeaderData; settings: HeaderSettings; menu: MenuItem[] };
  'footer': { data: FooterData; settings: FooterSettings; menu?: MenuItem[] };
  'monumental-hero': { data: MonumentalHeroData; settings: MonumentalHeroSettings };
  'manifesto-grid': { data: ManifestoGridData; settings: ManifestoGridSettings };
  'project-index': { data: ProjectIndexData; settings: ProjectIndexSettings };
  'text-image-slab': { data: TextImageSlabData; settings: TextImageSlabSettings };
  'timeline-list': { data: TimelineListData; settings: TimelineListSettings };
  'faq-section': { data: FaqSectionData; settings: FaqSectionSettings };
  'contact-strip': { data: ContactStripData; settings: ContactStripSettings };
  'quote-wall': { data: QuoteWallData; settings: QuoteWallSettings };
};

declare module '@olonjs/core' {
  export interface SectionDataRegistry {
    'header': HeaderData;
    'footer': FooterData;
    'monumental-hero': MonumentalHeroData;
    'manifesto-grid': ManifestoGridData;
    'project-index': ProjectIndexData;
    'text-image-slab': TextImageSlabData;
    'timeline-list': TimelineListData;
    'faq-section': FaqSectionData;
    'contact-strip': ContactStripData;
    'quote-wall': QuoteWallData;
  }

  export interface SectionSettingsRegistry {
    'header': HeaderSettings;
    'footer': FooterSettings;
    'monumental-hero': MonumentalHeroSettings;
    'manifesto-grid': ManifestoGridSettings;
    'project-index': ProjectIndexSettings;
    'text-image-slab': TextImageSlabSettings;
    'timeline-list': TimelineListSettings;
    'faq-section': FaqSectionSettings;
    'contact-strip': ContactStripSettings;
    'quote-wall': QuoteWallSettings;
  }
}

export * from '@olonjs/core';
EOF

echo "-- Writing src/lib/ComponentRegistry.tsx..."
cat > src/lib/ComponentRegistry.tsx << 'EOF'
import React from 'react';
import { Header } from '@/components/header';
import { Footer } from '@/components/footer';
import { MonumentalHero } from '@/components/monumental-hero';
import { ManifestoGrid } from '@/components/manifesto-grid';
import { ProjectIndex } from '@/components/project-index';
import { TextImageSlab } from '@/components/text-image-slab';
import { TimelineList } from '@/components/timeline-list';
import { FaqSection } from '@/components/faq-section';
import { ContactStrip } from '@/components/contact-strip';
import { QuoteWall } from '@/components/quote-wall';

import type { SectionType } from '@olonjs/core';
import type { SectionComponentPropsMap } from '@/types';

export const ComponentRegistry: {
  [K in SectionType]: React.FC<SectionComponentPropsMap[K]>;
} = {
  'header': Header,
  'footer': Footer,
  'monumental-hero': MonumentalHero,
  'manifesto-grid': ManifestoGrid,
  'project-index': ProjectIndex,
  'text-image-slab': TextImageSlab,
  'timeline-list': TimelineList,
  'faq-section': FaqSection,
  'contact-strip': ContactStrip,
  'quote-wall': QuoteWall
};
EOF

echo "-- Writing src/lib/schemas.ts..."
cat > src/lib/schemas.ts << 'EOF'
export { BaseSectionData, BaseArrayItem, BaseSectionSettingsSchema, CtaSchema } from './base-schemas';

import { HeaderSchema } from '@/components/header';
import { FooterSchema } from '@/components/footer';
import { MonumentalHeroSchema } from '@/components/monumental-hero';
import { ManifestoGridSchema } from '@/components/manifesto-grid';
import { ProjectIndexSchema } from '@/components/project-index';
import { TextImageSlabSchema } from '@/components/text-image-slab';
import { TimelineListSchema } from '@/components/timeline-list';
import { FaqSectionSchema } from '@/components/faq-section';
import { ContactStripSchema } from '@/components/contact-strip';
import { QuoteWallSchema } from '@/components/quote-wall';

export const SECTION_SCHEMAS = {
  'header': HeaderSchema,
  'footer': FooterSchema,
  'monumental-hero': MonumentalHeroSchema,
  'manifesto-grid': ManifestoGridSchema,
  'project-index': ProjectIndexSchema,
  'text-image-slab': TextImageSlabSchema,
  'timeline-list': TimelineListSchema,
  'faq-section': FaqSectionSchema,
  'contact-strip': ContactStripSchema,
  'quote-wall': QuoteWallSchema
} as const;

export type SectionType = keyof typeof SECTION_SCHEMAS;
EOF

echo "-- Writing src/lib/addSectionConfig.ts..."
cat > src/lib/addSectionConfig.ts << 'EOF'
import type { AddSectionConfig } from '@olonjs/core';

const addableSectionTypes = [
  'monumental-hero',
  'manifesto-grid',
  'project-index',
  'text-image-slab',
  'timeline-list',
  'faq-section',
  'contact-strip',
  'quote-wall'
] as const;

const sectionTypeLabels: Record<string, string> = {
  'monumental-hero': 'Monumental Hero',
  'manifesto-grid': 'Manifesto Grid',
  'project-index': 'Project Index',
  'text-image-slab': 'Text Image Slab',
  'timeline-list': 'Timeline List',
  'faq-section': 'FAQ Section',
  'contact-strip': 'Contact Strip',
  'quote-wall': 'Quote Wall'
};

function getDefaultSectionData(type: string): Record<string, unknown> {
  switch (type) {
    case 'monumental-hero':
      return {
        label: 'Practice',
        title: 'A studio for\nmeasured space',
        description: 'We shape architecture, exhibition systems, and spatial identity through strict proportion, material precision, and cultural clarity.'
      };
    case 'manifesto-grid':
      return {
        title: 'Manifesto',
        intro: 'Core positions that guide commissions, collaborations, and long-term spatial thinking.',
        items: []
      };
    case 'project-index':
      return {
        title: 'Selected projects',
        intro: 'A concise index of buildings, interiors, and cultural systems.',
        items: []
      };
    case 'text-image-slab':
      return {
        title: 'Spatial rigor',
        body: 'Every commission begins with use, sequence, threshold, and light.',
        eyebrow: 'Study'
      };
    case 'timeline-list':
      return {
        title: 'Practice timeline',
        intro: 'A chronology of the studio and its built work.',
        items: []
      };
    case 'faq-section':
      return {
        title: 'Questions',
        intro: 'Commissioning, schedules, and process.',
        items: []
      };
    case 'contact-strip':
      return {
        title: 'Start a conversation',
        description: 'Share your brief, site, and timeline.',
        details: []
      };
    case 'quote-wall':
      return {
        title: 'Selected voices',
        items: []
      };
    default:
      return {};
  }
}

export const addSectionConfig: AddSectionConfig = {
  addableSectionTypes: [...addableSectionTypes],
  sectionTypeLabels,
  getDefaultSectionData
};
EOF

echo "-- Writing page data..."
cat > src/data/pages/home.json << 'EOF'
{
  "id": "home-page",
  "slug": "home",
  "meta": {
    "title": "Atelier Nero — Architecture, Exhibition Systems, Spatial Direction",
    "description": "A radical architecture and exhibition design practice working with cultural institutions, private clients, and civic commissions."
  },
  "sections": [
    {
      "id": "home-monumental-hero-001",
      "type": "monumental-hero",
      "data": {
        "label": "Architecture / Exhibition / Signage",
        "title": "A practice\nfor exacting\nspace",
        "titleHighlight": "Buildings, interiors, and cultural systems",
        "description": "Atelier Nero designs structures, rooms, routes, and visual orders with a severe modernist discipline. We work across architecture, exhibition design, interiors, and wayfinding, producing spaces that remain clear under pressure and legible over time.",
        "primaryCta": {
          "id": "home-hero-cta-1",
          "label": "View projects",
          "href": "/projects",
          "variant": "primary"
        },
        "secondaryCta": {
          "id": "home-hero-cta-2",
          "label": "Read the practice",
          "href": "/about",
          "variant": "secondary"
        },
        "image": {
          "url": "https://images.unsplash.com/photo-1511818966892-d7d671e672a2?auto=format&fit=crop&w=1400&q=80",
          "alt": "Minimal concrete stair and gallery wall lit by sharp daylight"
        },
        "note": "Founded 2014 — Rome, Milan, international"
      },
      "settings": {}
    },
    {
      "id": "home-manifesto-grid-002",
      "type": "manifesto-grid",
      "data": {
        "label": "Method",
        "title": "Principles before style",
        "intro": "The studio rejects decorative noise, generic hospitality language, and trend-led softness. Each commission begins with order, sequence, and the structural dignity of the brief.",
        "items": [
          {
            "id": "manifesto-item-001",
            "number": "01",
            "title": "Structure first",
            "body": "We begin from circulation, hierarchy, load, light, and adjacency. Form arrives through constructional intelligence, not styling."
          },
          {
            "id": "manifesto-item-002",
            "number": "02",
            "title": "Material restraint",
            "body": "Concrete, limestone, steel, lacquer, felt, glass, and timber are used with precision and without excess gesture."
          },
          {
            "id": "manifesto-item-003",
            "number": "03",
            "title": "Cultural legibility",
            "body": "Museums, galleries, and public-facing projects must orient the visitor instantly. Wayfinding is architecture, not an afterthought."
          },
          {
            "id": "manifesto-item-004",
            "number": "04",
            "title": "Measured atmosphere",
            "body": "Mood emerges from ratio, shadow, acoustic control, threshold, and pacing. Calm comes from order, not decoration."
          }
        ]
      },
      "settings": {}
    },
    {
      "id": "home-project-index-003",
      "type": "project-index",
      "data": {
        "label": "Selected work",
        "title": "Recent commissions",
        "intro": "Private residences, exhibition systems, libraries, and institutional interiors delivered with consistent spatial discipline and precise technical coordination.",
        "items": [
          {
            "id": "project-home-001",
            "year": "2025",
            "title": "Casa Ovest",
            "category": "Residence",
            "location": "Milan",
            "body": "A courtyard house reworked through axial openings, graphite steel joinery, and a severe sequence of compressed and expanded rooms.",
            "href": "/projects",
            "image": {
              "url": "https://images.unsplash.com/photo-1519643381401-22c77e60520e?auto=format&fit=crop&w=900&q=80",
              "alt": "Minimal modern interior with concrete wall and linear opening"
            }
          },
          {
            "id": "project-home-002",
            "year": "2024",
            "title": "Atlas Gallery Routing System",
            "category": "Wayfinding",
            "location": "Basel",
            "body": "A complete exhibition navigation language spanning facade entry, ticketing, floor graphics, room codes, and archive indexing.",
            "href": "/projects",
            "image": {
              "url": "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=900&q=80",
              "alt": "Modern gallery corridor with directional sightlines and white walls"
            }
          },
          {
            "id": "project-home-003",
            "year": "2023",
            "title": "Archivio Civico Reading Hall",
            "category": "Public interior",
            "location": "Turin",
            "body": "Reading tables, acoustic partitions, shelving order, and a new luminous ceiling designed as a disciplined study landscape.",
            "href": "/projects",
            "image": {
              "url": "https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=900&q=80",
              "alt": "Long institutional interior with tables and controlled ceiling light"
            }
          }
        ]
      },
      "settings": {}
    },
    {
      "id": "home-quote-wall-004",
      "type": "quote-wall",
      "data": {
        "label": "Selected voices",
        "title": "The work is quiet in tone and uncompromising in order",
        "items": [
          {
            "id": "quote-home-001",
            "quote": "They gave the building a logic we could actually operate.",
            "author": "Marta Biagini",
            "role": "Director, Archivio Civico"
          },
          {
            "id": "quote-home-002",
            "quote": "The exhibition felt inevitable, as if the route had always been there.",
            "author": "Jonas Feld",
            "role": "Curator, Atlas Gallery"
          },
          {
            "id": "quote-home-003",
            "quote": "Every detail sharpened the architecture instead of softening it.",
            "author": "Riccardo Livi",
            "role": "Private client"
          }
        ]
      },
      "settings": {}
    },
    {
      "id": "home-contact-strip-005",
      "type": "contact-strip",
      "data": {
        "label": "Commissions",
        "title": "Bring us a brief with difficulty, scale, and consequence",
        "description": "We engage with homes, cultural buildings, institutional interiors, exhibition systems, and wayfinding frameworks. Early stage strategy, concept design, detailed development, and consultant coordination are handled within one rigorous process.",
        "details": [
          {
            "id": "contact-detail-home-001",
            "label": "New Business",
            "value": "studio@ateliernero.it"
          },
          {
            "id": "contact-detail-home-002",
            "label": "Press",
            "value": "press@ateliernero.it"
          },
          {
            "id": "contact-detail-home-003",
            "label": "Locations",
            "value": "Rome / Milan"
          }
        ],
        "primaryCta": {
          "id": "contact-strip-cta-home-001",
          "label": "Start a conversation",
          "href": "/contact",
          "variant": "primary"
        }
      },
      "settings": {}
    }
  ]
}
EOF

cat > src/data/pages/about.json << 'EOF'
{
  "id": "about-page",
  "slug": "about",
  "meta": {
    "title": "Practice — Atelier Nero",
    "description": "The practice, method, timeline, and thinking behind Atelier Nero."
  },
  "sections": [
    {
      "id": "about-text-image-001",
      "type": "text-image-slab",
      "data": {
        "label": "Practice",
        "eyebrow": "Studio profile",
        "title": "Architecture as a system of clear decisions",
        "body": "Atelier Nero was established in Rome in 2014 by architects Elisa Marconi and Davide Serra. The studio works where architecture meets movement, display, and institutional clarity: residences, galleries, cultural interiors, public programs, and signage systems. We prefer exact language, durable materials, and spatial sequences that remain intelligible without explanation.",
        "image": {
          "url": "https://images.unsplash.com/photo-1518005020951-eccb494ad742?auto=format&fit=crop&w=1400&q=80",
          "alt": "Monumental concrete facade with rhythmic openings"
        },
        "primaryCta": {
          "id": "about-cta-001",
          "label": "See selected projects",
          "href": "/projects",
          "variant": "primary"
        }
      },
      "settings": {}
    },
    {
      "id": "about-timeline-002",
      "type": "timeline-list",
      "data": {
        "label": "Timeline",
        "title": "A practice built through sequential scales",
        "intro": "The studio has moved from residential interiors to public commissions and exhibition infrastructure without changing its disciplinary core.",
        "items": [
          {
            "id": "about-timeline-item-001",
            "year": "2014",
            "title": "Practice founded in Rome",
            "body": "Initial work focused on residential alterations, artist studios, and bespoke interior systems."
          },
          {
            "id": "about-timeline-item-002",
            "year": "2018",
            "title": "First institutional wayfinding commission",
            "body": "A navigation system for a civic archive introduced the studio to public-facing cultural infrastructure."
          },
          {
            "id": "about-timeline-item-003",
            "year": "2021",
            "title": "Exhibition design expands internationally",
            "body": "Temporary and long-duration exhibitions in Switzerland and Germany extended the studio’s work into logistics, visitor flow, and display architecture."
          },
          {
            "id": "about-timeline-item-004",
            "year": "2025",
            "title": "Integrated architecture and signage work",
            "body": "Current commissions often combine shell architecture, interiors, furnishings, and wayfinding into a single spatial language."
          }
        ]
      },
      "settings": {}
    },
    {
      "id": "about-manifesto-003",
      "type": "manifesto-grid",
      "data": {
        "label": "Discipline",
        "title": "How we work",
        "intro": "We maintain a small, senior-led structure. Drawings remain close to design thinking. Technical detail is developed early, not deferred.",
        "items": [
          {
            "id": "about-manifesto-item-001",
            "number": "A",
            "title": "Senior authorship",
            "body": "Every commission is led directly by the partners and reviewed through iterative drawing, model, and site dialogue."
          },
          {
            "id": "about-manifesto-item-002",
            "number": "B",
            "title": "Hard coordination",
            "body": "Consultant alignment, technical packages, and material tolerances are treated as design work, not administration."
          },
          {
            "id": "about-manifesto-item-003",
            "number": "C",
            "title": "Exact communication",
            "body": "We use concise documentation, controlled detailing, and clear decision gates to keep projects legible for clients and contractors."
          },
          {
            "id": "about-manifesto-item-004",
            "number": "D",
            "title": "Purposeful restraint",
            "body": "No formal move enters the project unless it clarifies use, hierarchy, or experience."
          }
        ]
      },
      "settings": {}
    },
    {
      "id": "about-quote-wall-004",
      "type": "quote-wall",
      "data": {
        "label": "Recognition",
        "title": "Trusted by clients who value clarity over spectacle",
        "items": [
          {
            "id": "about-quote-item-001",
            "quote": "Their process was as rigorous as their architecture.",
            "author": "Claudia Ferretti",
            "role": "Head of Real Estate, private client"
          },
          {
            "id": "about-quote-item-002",
            "quote": "Nothing was arbitrary. Every junction had a reason.",
            "author": "Luca Donati",
            "role": "Project engineer"
          },
          {
            "id": "about-quote-item-003",
            "quote": "They brought museum-level control to a civic brief.",
            "author": "Nora Weiss",
            "role": "Cultural programme director"
          }
        ]
      },
      "settings": {}
    }
  ]
}
EOF

cat > src/data/pages/projects.json << 'EOF'
{
  "id": "projects-page",
  "slug": "projects",
  "meta": {
    "title": "Projects — Atelier Nero",
    "description": "Selected projects across architecture, interiors, exhibitions, and wayfinding."
  },
  "sections": [
    {
      "id": "projects-text-image-001",
      "type": "text-image-slab",
      "data": {
        "label": "Portfolio",
        "eyebrow": "Selected work",
        "title": "Buildings, rooms, routes, and graphic orders",
        "body": "Our portfolio moves between durable architecture and temporary systems of display. The same criteria apply in both domains: ratio, sequence, material restraint, and exacting clarity.",
        "image": {
          "url": "https://images.unsplash.com/photo-1512917774080-9991f1c4c750?auto=format&fit=crop&w=1400&q=80",
          "alt": "Modern architectural volume with sharp geometric facade"
        },
        "primaryCta": {
          "id": "projects-cta-001",
          "label": "Request portfolio PDF",
          "href": "/contact",
          "variant": "primary"
        }
      },
      "settings": {}
    },
    {
      "id": "projects-index-002",
      "type": "project-index",
      "data": {
        "label": "Current index",
        "title": "Eight projects in focus",
        "intro": "A compact survey of domestic, public, and cultural work currently representative of the studio’s direction.",
        "items": [
          {
            "id": "projects-index-item-001",
            "year": "2025",
            "title": "Casa Ovest",
            "category": "Residence",
            "location": "Milan",
            "body": "A private home organized around a strict courtyard axis, thickened walls, and shadow-led circulation.",
            "href": "/contact",
            "image": {
              "url": "https://images.unsplash.com/photo-1519643381401-22c77e60520e?auto=format&fit=crop&w=900&q=80",
              "alt": "Monochrome interior with concrete and sharp daylight"
            }
          },
          {
            "id": "projects-index-item-002",
            "year": "2025",
            "title": "Studio Forma Headquarters",
            "category": "Workplace interior",
            "location": "Rome",
            "body": "An office floor recast as a sequence of proportioned work bays, archive walls, and quiet meeting chambers.",
            "href": "/contact",
            "image": {
              "url": "https://images.unsplash.com/photo-1497366754035-f200968a6e72?auto=format&fit=crop&w=900&q=80",
              "alt": "Architectural office interior with long tables and controlled grid"
            }
          },
          {
            "id": "projects-index-item-003",
            "year": "2024",
            "title": "Atlas Gallery Routing System",
            "category": "Wayfinding",
            "location": "Basel",
            "body": "A monochrome navigation family for a gallery campus spanning entry, ticketing, rooms, and back-of-house logistics.",
            "href": "/contact",
            "image": {
              "url": "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85?auto=format&fit=crop&w=900&q=80",
              "alt": "Clean gallery hallway with strong alignment"
            }
          },
          {
            "id": "projects-index-item-004",
            "year": "2024",
            "title": "Padiglione Uno",
            "category": "Exhibition architecture",
            "location": "Venice",
            "body": "A temporary pavilion using folded steel plates, shadow gaps, and disciplined visitor movement.",
            "href": "/contact",
            "image": {
              "url": "https://images.unsplash.com/photo-1511818966892-d7d671e672a2?auto=format&fit=crop&w=900&q=80",
              "alt": "Exhibition space with concrete stair and hard lines"
            }
          }
        ]
      },
      "settings": {}
    },
    {
      "id": "projects-faq-003",
      "type": "faq-section",
      "data": {
        "label": "Commissioning",
        "title": "Portfolio questions",
        "intro": "A concise guide for prospective clients planning architectural or exhibition work.",
        "items": [
          {
            "id": "projects-faq-item-001",
            "question": "What scale of project do you accept?",
            "answer": "We work across interiors, houses, galleries, and cultural infrastructure. The key criterion is not size but the seriousness of the brief and the client’s commitment to architectural discipline."
          },
          {
            "id": "projects-faq-item-002",
            "question": "Do you collaborate with local executive teams?",
            "answer": "Yes. We frequently lead concept and design development while coordinating with local delivery architects, consultants, and fabricators."
          },
          {
            "id": "projects-faq-item-003",
            "question": "Can signage and spatial identity be integrated from the outset?",
            "answer": "Yes. We prefer integrated workflows where architecture, graphics, and visitor movement are designed together."
          }
        ]
      },
      "settings": {}
    },
    {
      "id": "projects-contact-004",
      "type": "contact-strip",
      "data": {
        "label": "Access",
        "title": "Request a meeting, portfolio, or project review",
        "description": "Send us the site, programme, desired schedule, and available drawings. We will respond with scope, fit, and next-step requirements.",
        "details": [
          {
            "id": "projects-contact-detail-001",
            "label": "Email",
            "value": "studio@ateliernero.it"
          },
          {
            "id": "projects-contact-detail-002",
            "label": "Review window",
            "value": "5 business days"
          },
          {
            "id": "projects-contact-detail-003",
            "label": "Formats",
            "value": "PDF / DWG / brief notes"
          }
        ],
        "primaryCta": {
          "id": "projects-contact-cta-001",
          "label": "Contact the studio",
          "href": "/contact",
          "variant": "primary"
        }
      },
      "settings": {}
    }
  ]
}
EOF

cat > src/data/pages/contact.json << 'EOF'
{
  "id": "contact-page",
  "slug": "contact",
  "meta": {
    "title": "Contact — Atelier Nero",
    "description": "Contact Atelier Nero for architecture, exhibition design, interiors, and wayfinding commissions."
  },
  "sections": [
    {
      "id": "contact-text-image-001",
      "type": "text-image-slab",
      "data": {
        "label": "Contact",
        "eyebrow": "New commissions",
        "title": "Bring context, drawings, and intent",
        "body": "The strongest first conversations are specific. Share the location, programme, constraints, timeline, and the level of architectural ambition expected from the project. We can then determine fit, structure, and scope.",
        "image": {
          "url": "https://images.unsplash.com/photo-1518005020951-eccb494ad742?auto=format&fit=crop&w=1400&q=80",
          "alt": "Architectural concrete facade with sharp vertical rhythm"
        },
        "primaryCta": {
          "id": "contact-page-cta-001",
          "label": "Email the studio",
          "href": "mailto:studio@ateliernero.it",
          "variant": "primary"
        }
      },
      "settings": {}
    },
    {
      "id": "contact-contact-strip-002",
      "type": "contact-strip",
      "data": {
        "label": "Coordinates",
        "title": "Rome studio, Milan meetings, international collaboration",
        "description": "For private commissions, cultural projects, and institutional enquiries, contact the studio directly. Site visits and briefing sessions are arranged by appointment.",
        "details": [
          {
            "id": "contact-detail-001",
            "label": "Studio",
            "value": "Via del Porto 18, 00154 Rome"
          },
          {
            "id": "contact-detail-002",
            "label": "Phone",
            "value": "+39 06 9485 2210"
          },
          {
            "id": "contact-detail-003",
            "label": "Email",
            "value": "studio@ateliernero.it"
          }
        ],
        "primaryCta": {
          "id": "contact-page-cta-002",
          "label": "Request an appointment",
          "href": "mailto:studio@ateliernero.it?subject=Project%20Enquiry",
          "variant": "primary"
        }
      },
      "settings": {}
    },
    {
      "id": "contact-faq-003",
      "type": "faq-section",
      "data": {
        "label": "Practicalities",
        "title": "Before we begin",
        "intro": "Useful answers for clients preparing an architectural or cultural commission.",
        "items": [
          {
            "id": "contact-faq-item-001",
            "question": "What should we send in a first email?",
            "answer": "A short brief, address, photographs, drawings if available, target budget range, and intended timetable."
          },
          {
            "id": "contact-faq-item-002",
            "question": "Do you work outside Italy?",
            "answer": "Yes. We collaborate internationally for exhibition, signage, and interior commissions, and selectively for architecture."
          },
          {
            "id": "contact-faq-item-003",
            "question": "Can you review an existing concept?",
            "answer": "Yes. We often enter at strategy or concept review stage to refine order, circulation, and architectural hierarchy."
          }
        ]
      },
      "settings": {}
    },
    {
      "id": "contact-quote-wall-004",
      "type": "quote-wall",
      "data": {
        "label": "Approach",
        "title": "We prefer precise questions and serious briefs",
        "items": [
          {
            "id": "contact-quote-item-001",
            "quote": "Clarity at the beginning saves months later.",
            "author": "Elisa Marconi",
            "role": "Co-founder"
          },
          {
            "id": "contact-quote-item-002",
            "quote": "A disciplined brief is already part of the architecture.",
            "author": "Davide Serra",
            "role": "Co-founder"
          },
          {
            "id": "contact-quote-item-003",
            "quote": "We look for projects where form must answer to use.",
            "author": "Atelier Nero",
            "role": "Studio principle"
          }
        ]
      },
      "settings": {}
    }
  ]
}
EOF

npm run build

echo ""
echo "Spec-compliance checklist:"
echo "[x] shadcn/ui init and component install run first"
echo "[x] only tenant-authored files written under src/** and index.html"
echo "[x] src/App.tsx not modified"
echo "[x] src/lib/base-schemas.ts not modified"
echo "[x] light and dark mode supported"
echo "[x] typography contract respected in src/index.css and theme.json"
echo "[x] exact Google Fonts import is first line of src/index.css"
echo "[x] theme.json includes exact font families: Manrope / Playfair Display / IBM Plex Mono"
echo "[x] header/footer preserve editable menu schema surface"
echo "[x] header uses resolved menu prop; footer prefers resolved menu prop"
echo "[x] 10 section types wired through types, registry, schemas, addSectionConfig"
echo "[x] 4 authored pages with real business content"
echo "[x] npm run build completed"