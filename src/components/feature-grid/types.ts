import { z } from 'zod';
import { FeatureGridSchema, FeatureGridSettingsSchema } from './schema';

export type FeatureGridData     = z.infer<typeof FeatureGridSchema>;
export type FeatureGridSettings = z.infer<typeof FeatureGridSettingsSchema>;
