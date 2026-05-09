import { z } from 'zod';
import { BaseSectionSettingsSchema } from '@/lib/base-schemas';
import { TimelineListSchema } from './schema';

export type TimelineListData = z.infer<typeof TimelineListSchema>;
export type TimelineListSettings = z.infer<typeof BaseSectionSettingsSchema>;
