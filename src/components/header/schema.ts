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
  badge: z.string().optional().describe('ui:text'),
  menu: z.array(MenuItemSchema).optional().describe('ui:list')
});
