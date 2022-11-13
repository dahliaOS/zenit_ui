import { newSpecPage } from "@stencil/core/testing";
import { Checkbox } from "./checkbox";

describe('zenit-checkbox', () => {
  it('renders', async () => {
    const { root } = await newSpecPage({
      components: [Checkbox],
      html: '<zenit-checkbox />',
    });
    expect(root).toEqualHtml(`
      <zenit-checkbox aria-checked="false" role="checkbox" tabindex="0">
        <mock:shadow-root>
        <svg data-checked="off" data-from-state fill="none" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
          <rect class="--bg" fill="#0475F7" height="24" rx="6" width="24"></rect>
          <path class="--mark" d="M 6 12 L 10 16 L 18 8" stroke="#FAFAFA" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
          <path class="--mixed" d="M 6 12 L 10 12 L 18 12" stroke="#FAFAFA" stroke-linecap="round" stroke-width="0"></path>
        </svg>
        </mock:shadow-root>
      </zenit-checkbox>
    `);
  });
  it('toggles', async () => {
    const { root, waitForChanges } = await newSpecPage({
      components: [Checkbox],
      html: '<zenit-checkbox />',
    });
    root.click();
    await waitForChanges();
    expect(root).toEqualHtml(`
      <zenit-checkbox aria-checked="true" role="checkbox" tabindex="0">
        <mock:shadow-root>
        <svg data-checked="on" data-from-state="off" fill="none" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
          <rect class="--bg" fill="#0475F7" height="24" rx="6" width="24"></rect>
          <path class="--mark" d="M 6 12 L 10 16 L 18 8" stroke="#FAFAFA" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
          <path class="--mixed" d="M 6 12 L 10 12 L 18 12" stroke="#FAFAFA" stroke-linecap="round" stroke-width="0"></path>
        </svg>
        </mock:shadow-root>
      </zenit-checkbox>
    `);
  });
  it('renders when disabled', async () => {
    const { root } = await newSpecPage({
      components: [Checkbox],
      html: '<zenit-checkbox disabled />',
    });
    expect(root).toEqualHtml(`
      <zenit-checkbox aria-checked="false" aria-disabled disabled role="checkbox" tabindex="0">
        <mock:shadow-root>
        <svg data-checked="off" data-disabled data-from-state fill="none" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
          <rect class="--bg" fill="#0475F7" height="24" rx="6" width="24"></rect>
          <path class="--mark" d="M 6 12 L 10 16 L 18 8" stroke="#FAFAFA" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
          <path class="--mixed" d="M 6 12 L 10 12 L 18 12" stroke="#FAFAFA" stroke-linecap="round" stroke-width="0"></path>
        </svg>
        </mock:shadow-root>
      </zenit-checkbox>
    `);
  });
  it('does not toggle when disabled', async () => {
    const { root, waitForChanges } = await newSpecPage({
      components: [Checkbox],
      html: '<zenit-checkbox disabled />',
    });
    root.click();
    await waitForChanges();
    // expect: unchanged
    expect(root).toEqualHtml(`
      <zenit-checkbox aria-checked="false" aria-disabled disabled role="checkbox" tabindex="0">
        <mock:shadow-root>
        <svg data-checked="off" data-disabled data-from-state fill="none" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
          <rect class="--bg" fill="#0475F7" height="24" rx="6" width="24"></rect>
          <path class="--mark" d="M 6 12 L 10 16 L 18 8" stroke="#FAFAFA" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
          <path class="--mixed" d="M 6 12 L 10 12 L 18 12" stroke="#FAFAFA" stroke-linecap="round" stroke-width="0"></path>
        </svg>
        </mock:shadow-root>
      </zenit-checkbox>
    `);
  });
  it('cycles "off, mixed, on, off" in tristate', async () => {
    const { root, waitForChanges } = await newSpecPage({
      components: [Checkbox],
      html: '<zenit-checkbox tristate />',
    });
    root.click();
    await waitForChanges();
    expect(root).toEqualHtml(`
      <zenit-checkbox aria-checked="mixed" tristate role="checkbox" tabindex="0">
        <mock:shadow-root>
        <svg data-checked="mixed" data-from-state="off" fill="none" height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg">
          <rect class="--bg" fill="#0475F7" height="24" rx="6" width="24"></rect>
          <path class="--mark" d="M 6 12 L 10 16 L 18 8" stroke="#FAFAFA" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"></path>
          <path class="--mixed" d="M 6 12 L 10 12 L 18 12" stroke="#FAFAFA" stroke-linecap="round" stroke-width="0"></path>
        </svg>
        </mock:shadow-root>
      </zenit-checkbox>
    `);
    root.click();
    await waitForChanges();
    // so it doesn't apply component prop changes 
    // to the host element, I guess?
    //expect(root.getAttribute("value")).toBe("on");
    expect(root.shadowRoot.firstElementChild.getAttribute("data-checked")).toBe("on");
    expect(root.shadowRoot.firstElementChild.getAttribute("data-from-state")).toBe("mixed");
  });
});