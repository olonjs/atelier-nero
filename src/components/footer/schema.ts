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
