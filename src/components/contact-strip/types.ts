import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { ContactStripSchema } from './schema';

export type ContactStripData = z.infer<typeof ContactStripSchema>;
export type ContactStripSettings = z.infer<typeof BaseSectionSettingsSchema>;
