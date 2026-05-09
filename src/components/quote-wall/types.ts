import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { QuoteWallSchema } from './schema';

export type QuoteWallData = z.infer<typeof QuoteWallSchema>;
export type QuoteWallSettings = z.infer<typeof BaseSectionSettingsSchema>;
