import type { CSSProperties } from 'react';
import type { FeatureGridData, FeatureGridSettings } from './types';

interface FeatureGridViewProps {
  data: FeatureGridData;
  settings?: FeatureGridSettings;
}

export function FeatureGrid({ data, settings }: FeatureGridViewProps) {
  const columns = settings?.columns ?? 3;
  const cards = data.cards ?? [];
  const tiers = data.tiers ?? [];

  const colClass =
    columns === 2 ? 'sm:grid-cols-2' :
    columns === 4 ? 'sm:grid-cols-2 lg:grid-cols-4' :
    'sm:grid-cols-2 lg:grid-cols-3';

  return (
    <section
      id="features"
      className="py-24 px-6 border-t border-border section-anchor"
      style={{
        '--local-bg': 'var(--background)',
        '--local-text': 'var(--foreground)',
        '--local-text-muted': 'var(--muted-foreground)',
        '--local-border': 'var(--border)',
      } as CSSProperties}
    >
      <div className="max-w-4xl mx-auto">

        {/* Section header */}
        <div className="max-w-xl mb-16">
          {data.label && (
            <p className="font-mono-olon text-xs font-medium tracking-label uppercase text-muted-foreground mb-5" data-jp-field="label">
              {data.label}
            </p>
          )}
          <h2 className="font-display font-normal text-foreground leading-tight tracking-tight mb-5" data-jp-field="sectionTitle">
            {data.sectionTitle}
            {data.sectionTitleItalic && (
              <>
                <br />
                <em className="not-italic text-primary-light" data-jp-field="sectionTitleItalic">{data.sectionTitleItalic}</em>
              </>
            )}
          </h2>
          {data.sectionLead && (
            <p className="text-base text-muted-foreground leading-relaxed" data-jp-field="sectionLead">
              {data.sectionLead}
            </p>
          )}
        </div>

        {/* Feature grid */}
        <div className={`grid grid-cols-1 ${colClass} gap-px bg-border`}>
          {cards.map((card) => {
            return (
              <div
                key={card.id ?? card.title}
                data-jp-item-id={card.id ?? card.title}
                data-jp-item-field="cards"
                className="bg-background p-7 flex flex-col gap-4 group hover:bg-card transition-colors duration-200"
              >
                {card.icon && (
                  <img
                    src={card.icon.url}
                    alt={card.icon.alt ?? ''}
                    aria-hidden={card.icon.alt ? undefined : true}
                    data-jp-field="icon"
                    className="w-10 h-10 shrink-0"
                  />
                )}
                <div>
                  <h3 className="text-sm font-medium text-foreground mb-2 leading-snug" data-jp-field="title">
                    {card.title}
                  </h3>
                  <p className="text-sm text-muted-foreground leading-relaxed" data-jp-field="description">
                    {card.description}
                  </p>
                </div>
              </div>
            );
          })}
        </div>

        {/* Proof strip */}
        {(data.proofStatement || tiers.length > 0) && (
          <div className="mt-6 flex flex-col sm:flex-row items-start sm:items-center gap-6 px-7 py-5 rounded-lg border border-border bg-card">
            {data.proofStatement && (
              <div className="flex-1">
                <p className="text-sm font-medium text-foreground mb-0.5">
                  <span data-jp-field="proofStatement">{data.proofStatement}</span>
                </p>
                {data.proofSub && (
                  <p className="text-[12px] text-muted-foreground" data-jp-field="proofSub">
                    {data.proofSub}
                  </p>
                )}
              </div>
            )}
            {tiers.length > 0 && (
              <div className="flex items-center gap-4 shrink-0">
                {tiers.map((tier) => (
                  <div
                    key={tier.id ?? tier.label}
                    data-jp-item-id={tier.id ?? tier.label}
                    data-jp-item-field="tiers"
                    className="text-center"
                  >
                    <div className="text-xs font-medium text-foreground" data-jp-field="label">{tier.label}</div>
                  </div>
                ))}
              </div>
            )}
          </div>
        )}
      </div>
    </section>
  );
}
