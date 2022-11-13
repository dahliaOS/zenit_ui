import { newSpecPage } from "@stencil/core/testing";
import { Switch } from "./switch";

describe('zenit-switch', () => {
  it('renders', async () => {
    const { root } = await newSpecPage({
      components: [Switch],
      html: '<zenit-switch />',
    });
    expect(root).toEqualHtml(`
      <zenit-switch aria-checked="false" role="switch" tabindex="0">
        <mock:shadow-root>
          <svg fill="none" height="24" viewBox="0 0 48 24" width="48" xmlns="http://www.w3.org/2000/svg">
            <rect class="--bg" fill="#00B26E" height="24" rx="12" width="48"></rect>
            <rect class="--thumb" fill="#FAFAFA" height="16" rx="8" width="16" x="4" y="4"></rect>
          </svg>
        </mock:shadow-root>
      </zenit-switch>
    `);
  });
  it('toggles', async () => {
    const { root, waitForChanges } = await newSpecPage({
      components: [Switch],
      html: '<zenit-switch />',
    });
    root.click();
    await waitForChanges();
    expect(root).toEqualHtml(`
      <zenit-switch aria-checked="true" role="switch" tabindex="0">
        <mock:shadow-root>
          <svg data-checked fill="none" height="24" viewBox="0 0 48 24" width="48" xmlns="http://www.w3.org/2000/svg">
            <rect class="--bg" fill="#00B26E" height="24" rx="12" width="48"></rect>
            <rect class="--thumb" fill="#FAFAFA" height="16" rx="8" width="16" x="4" y="4"></rect>
          </svg>
        </mock:shadow-root>
      </zenit-switch>
    `);
  });
  it('renders when disabled', async () => {
    const { root } = await newSpecPage({
      components: [Switch],
      html: '<zenit-switch disabled />',
    });
    expect(root).toEqualHtml(`
      <zenit-switch aria-checked="false" aria-disabled disabled role="switch" tabindex="0">
        <mock:shadow-root>
          <svg data-disabled fill="none" height="24" viewBox="0 0 48 24" width="48" xmlns="http://www.w3.org/2000/svg">
            <rect class="--bg" fill="#00B26E" height="24" rx="12" width="48"></rect>
            <rect class="--thumb" fill="#FAFAFA" height="16" rx="8" width="16" x="4" y="4"></rect>
          </svg>
        </mock:shadow-root>
      </zenit-switch>
    `);
  });
  it('does not toggle when disabled', async () => {
    const { root, waitForChanges } = await newSpecPage({
      components: [Switch],
      html: '<zenit-switch disabled />',
    });
    root.click();
    await waitForChanges();
    // expect: unchanged
    expect(root).toEqualHtml(`
      <zenit-switch aria-checked="false" aria-disabled disabled role="switch" tabindex="0">
        <mock:shadow-root>
          <svg data-disabled fill="none" height="24" viewBox="0 0 48 24" width="48" xmlns="http://www.w3.org/2000/svg">
            <rect class="--bg" fill="#00B26E" height="24" rx="12" width="48"></rect>
            <rect class="--thumb" fill="#FAFAFA" height="16" rx="8" width="16" x="4" y="4"></rect>
          </svg>
        </mock:shadow-root>
      </zenit-switch>
    `);
  });
});