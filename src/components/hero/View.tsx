import type { CSSProperties } from 'react';
import { ArrowRight, Github, Terminal } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { RadialBackground } from './RadialBackground';
import type { HeroData, HeroSettings } from './types';

interface HeroViewProps {
  data: HeroData;
  settings?: HeroSettings;
}

export function Hero({ data, settings }: HeroViewProps) {
  const showCode = settings?.showCode ?? true;
  const ctas = data.ctas ?? [];
  const heroImage = data.heroImage;

  return (
    <section
      className="relative overflow-hidden pt-36 pb-28 px-6"
      id={data.anchorId}
      style={{
        '--local-bg': 'var(--background)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-border': 'var(--border)',
      } as CSSProperties}
    >
      <RadialBackground />
      <div className="relative z-10 max-w-4xl mx-auto">
        <div className="grid grid-cols-1 md:grid-cols-20 gap-8 lg:gap-10 items-start">
          <div className="order-2 md:order-1 md:col-span-11">

          {/* Eyebrow */}
          {data.eyebrow && (
            <p className="font-mono-olon text-xs font-medium tracking-label uppercase text-muted-foreground mb-3" data-jp-field="eyebrow">
              {data.eyebrow}
            </p>
          )}

          {/* Headline */}
          <h1 className="font-display font-bold text-7xl  text-foreground leading-tight tracking-tight mb-1" data-jp-field="title">
            {data.title}
          </h1>
          {data.titleHighlight && (
            <h2 className="font-display font-normal italic text-5xl md:text-6xl text-primary-light leading-tight tracking-tight mb-7" data-jp-field="titleHighlight">
              {data.titleHighlight}
            </h2>
          )}

          {/* Body */}
          {data.description && (
            <p className="text-md text-muted-foreground leading-relaxed max-w-xl mb-10" data-jp-field="description">
              {data.description}
            </p>
          )}

          {/* CTA row */}
          <div className="flex flex-wrap items-center gap-3 mb-16">
            {ctas.map((cta) => (
              <Button
                key={cta.id ?? cta.label}
                variant={cta.variant === 'accent' ? 'accent' : cta.variant === 'secondary' ? 'outline' : 'default'}
                size="lg"
                className="text-base"
                asChild
              >
                <a
                  href={cta.href}
                  data-jp-item-id={cta.id ?? cta.label}
                  data-jp-item-field="ctas"
                  data-jp-field="href"
                >
                  {cta.variant === 'accent' ? (
                    <><span data-jp-field="label">{cta.label}</span> <ArrowRight className="h-4 w-4" /></>
                  ) : cta.variant === 'secondary' ? (
                    <><Github className="h-4 w-4" /> <span data-jp-field="label">{cta.label}</span></>
                  ) : (
                    <span data-jp-field="label">{cta.label}</span>
                  )}
                </a>
              </Button>
            ))}
            {data.docsHref && (
              <a
                href={data.docsHref}
                data-jp-field="docsHref"
                className="text-base text-muted-foreground hover:text-foreground transition-colors flex items-center gap-1.5"
              >
                <Terminal className="h-4 w-4" />
                <span data-jp-field="docsLabel">{data.docsLabel ?? 'Read the docs'}</span>
              </a>
            )}
          </div>

            {/* Code block */}
            {showCode && (
              <div className="rounded-lg border border-border overflow-hidden max-w-2xl">
                <div className="flex items-center justify-between px-4 py-2.5 bg-elevated border-b border-border">
                  <div className="flex items-center gap-1.5">
                    <span className="w-2.5 h-2.5 rounded-full bg-border-strong" />
                    <span className="w-2.5 h-2.5 rounded-full bg-border-strong" />
                    <span className="w-2.5 h-2.5 rounded-full bg-border-strong" />
                  </div>
                  <span className="font-mono-olon text-xs text-muted-foreground">olon.config.ts</span>
                  <span className="font-mono-olon text-xs text-primary-400 hover:text-primary-light cursor-default transition-colors" data-jp-field="codeLabel">
                    {data.codeLabel ?? 'Copy'}
                  </span>
                </div>
                <pre className="px-5 py-5 bg-card font-mono-olon text-sm leading-[1.8] overflow-x-auto">
                  <code>
                    <span><span className="text-primary-400">import</span><span className="text-foreground"> {'{ defineConfig }'} </span><span className="text-primary-400">from</span><span className="text-primary-200"> 'olonjs'</span></span>
                    {'\n\n'}
                    <span><span className="text-primary-400">export default</span><span className="text-primary-light"> defineConfig</span><span className="text-foreground">{'({'}</span></span>
                    {'\n  '}
                    <span><span className="text-accent">tenants</span><span className="text-foreground">: [{'{'}</span></span>
                    {'\n    '}
                    <span><span className="text-accent">slug</span><span className="text-foreground">: </span><span className="text-primary-200">'acme-corp'</span><span className="text-muted-foreground">,</span></span>
                    {'\n    '}
                    <span><span className="text-accent">routes</span><span className="text-foreground">: </span><span className="text-primary-light">autoDiscover</span><span className="text-foreground">(</span><span className="text-primary-200">'./src/pages'</span><span className="text-foreground">),</span></span>
                    {'\n    '}
                    <span><span className="text-accent">schema</span><span className="text-foreground">: </span><span className="text-primary-200">'./schemas/page.json'</span><span className="text-foreground">,</span></span>
                    {'\n  '}
                    <span><span className="text-foreground">{'}],'}</span></span>
                    {'\n  '}
                    <span><span className="text-accent">output</span><span className="text-foreground">: </span><span className="text-primary-200">'vercel'</span><span className="text-muted-foreground">,  </span><span className="text-muted-foreground">{'// \'nx\' | \'vercel\' | \'custom\''}</span></span>
                    {'\n  '}
                    <span><span className="text-accent">governance</span><span className="text-foreground">: {'{'} </span><span className="text-accent">audit</span><span className="text-foreground">: </span><span className="text-primary-light">true</span><span className="text-foreground">, </span><span className="text-accent">strict</span><span className="text-foreground">: </span><span className="text-primary-light">true</span><span className="text-foreground"> {'}'}</span></span>
                    {'\n'}
                    <span><span className="text-foreground">{'}'}</span></span>
                  </code>
                </pre>
              </div>
            )}
          </div>

          {/* Right column (40%) - image placeholder */}
          <div className="order-1 md:order-2 md:col-span-9">
            <div className="relative rounded-md overflow-hidden bg-card hero-media-portrait">
              <img
                src={heroImage?.url ?? '/images/olon-hero.png'}
                alt={heroImage?.alt ?? 'Olon hero visual'}
                data-jp-field="heroImage"
                className="absolute inset-0 w-full h-full object-cover"
              />
              <div className="absolute inset-0 pointer-events-none hero-media-overlay" />
            </div>
          </div>
        </div>
      </div>
    </section>
  );
}
